import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chargemod/models/error_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../configs/enums.dart';
import '../configs/secure_storage.dart';
import '../providers/auth_provider.dart';
import 'login_services.dart';

class Networking {
  String baseUrl = 'https://as-uat.console.chargemod.com';
  String organizationId = '64941897fdb322dbf94ad2b8';
  String projectId = '6494141957d29409895704d2';
  String appVersion = '1.0.0';
  static String getAccessToken() {
    String accessToken = AuthProvider.accessToken;
    return accessToken.toString();
  }
  static Future<String> getNewAccessToken() async {
    String? refreshTkn = await SecureStorage.getRefreshToken();
    String? accessTkn = await SecureStorage.getaccessToken();
    if (refreshTkn != null) {
      var data =
      await LoginServices.refreshAccessToken(refreshToken: refreshTkn);
      String accessToken = data["data"]["accessToken"];
      print("access token is\n$accessToken");
      return accessToken.toString();
    }else{
      throw "ERROR in Refresh TOken";
    }
  }


  Future<bool> testServerConnection() async {
    try {
      final response = await http.get(Uri.parse('https://as-uat.console.chargemod.com/health'));
      return response.statusCode ==
          200; // Successful connection (status code 200)
    } catch (e) {
      return false; // Failed to connect
    }
  }

  Future postRequest({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? customHeaders,
    String? customURL,
  }) async {
    String urlStr ="$baseUrl/temporary/sde1flutterATSR/$organizationId/$projectId/$appVersion$endpoint";
    if (customURL != null) {
      urlStr= customURL;
    }

    Uri url = Uri.parse(urlStr);
    log(url.toString());
    String status = 'error';
    String details = '';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization":"Bearer ${getAccessToken()}"
    };
    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }
    try {
      http.Response response = await http
          .post(
            url,
            headers: headers,
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 59));

      String data = response.body;
      var jsonDecoded = jsonDecode(data);
      log("json Decoded - $jsonDecoded");
      if (response.statusCode == 401) {
        String? newAccessToken = await getNewAccessToken();
        Map<String, String> newHeaders = {
          "Content-Type": "application/json",
          "Authorization":"Bearer $newAccessToken"
        };
        http.Response newResponse = await http
            .post(
          url,
          headers: newHeaders,
          body: jsonEncode(body),
        )
            .timeout(const Duration(seconds: 59));
        data = newResponse.body;
        jsonDecoded = jsonDecode(data);
      }

      /*if (jsonDecoded.containsKey("stack")) {
        var jsonError = jsonDecoded["stack"];

        log("error inside is $jsonError");
        status = jsonError;

        if (jsonDecoded["stack"].contains("error")) {
          status = jsonDecoded["stack"];
          details = jsonDecoded["stack"];
        }
        throw ErrorModel(
          type: ErrorType.error,
          status: status,
          details: details,
        );
      }*/
      return jsonDecoded;
    } on SocketException catch (e) {
      log(e.toString());
      throw ErrorModel(
        type: ErrorType.error,
        status: "No Internet connection",
        details:
            "Please fix your internet connection or check if app is allowed to access internet",
      );
    } on ErrorModel catch (e) {

      log(e.toString());
      throw ErrorModel(
        //return ErrorModel(
        type: e.type,
        status: e.status,
        details: e.details,
      );
    } catch (e, s) {
      log("Unexpected Error - $e \n $s");
      throw ErrorModel(
        type: ErrorType.unexpectedError,
        status: 'Something Went Wrong',
        details: "Please try again later",
      );
    }
  }

  Future getRequest({
    required String endpoint,
    Map<String, String>? customHeaders,
  }) async {
    Uri url = Uri.parse(
        "$baseUrl/temporary/sde1flutterATSR/$organizationId/$projectId/$appVersion$endpoint");
    String status = 'error';
    String details = '';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization":"Bearer ${getAccessToken()}"
    };
    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }
    try {
      http.Response response = await http
          .get(
            url,
            headers: headers,
          )
          .timeout(const Duration(seconds: 59));

      String data = response.body;
      var jsonDecoded = jsonDecode(data);
      log("json Decoded - $jsonDecoded");
      if (response.statusCode == 401) {
        String? newAccessToken = await getNewAccessToken();
        Map<String, String> newHeaders = {
          "Content-Type": "application/json",
          "Authorization":"Bearer $newAccessToken"
        };
        http.Response newResponse = await http
            .get(
          url,
          headers: newHeaders,
        )
            .timeout(const Duration(seconds: 59));
        data = newResponse.body;
        jsonDecoded = jsonDecode(data);
      }
      return jsonDecoded;
    } on SocketException catch (e) {
      log(e.toString());
      throw ErrorModel(
        type: ErrorType.error,
        status: "No Internet connection",
        details:
            "Please fix your internet connection or check if app is allowed to access internet",
      );
    } on ErrorModel catch (e) {
      log(e.toString());
      throw ErrorModel(
        //return ErrorModel(
        type: e.type,
        status: e.status,
        details: e.details,
      );
    } catch (e, s) {
      log("Unexpected Error - $e \n $s");
      throw ErrorModel(
        type: ErrorType.unexpectedError,
        status: 'Something Went Wrong',
        details: "Please try again later",
      );
    }
  }
}
