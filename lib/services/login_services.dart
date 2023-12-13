import 'dart:developer';

import '../configs/secure_storage.dart';
import 'networking.dart';

class LoginServices {
  static final Networking networking = Networking();

  static Future<Map<String, dynamic>> sendPhoneOTP({
    required int phone,
  }) async {
    Map<String, dynamic> body = {"mobile": phone};
    var data = await networking.postRequest(endpoint: "/signIn", body: body);
    return data;
  }

  static Future<Map<String, dynamic>> resendPhoneOTP({
    required int phone,
  }) async {
    Map<String, dynamic> body = {"mobile": phone, "type": "text"};
    var data = await networking.postRequest(endpoint: "/resend", body: body);
    return data;
  }

  static Future<Map<String, dynamic>> verifyPhoneOTP({
    required int phone,
    required int otp,
  }) async {
    Map<String, dynamic> body = {"mobile": phone, "otp": otp};
    try{
      var data = await networking.postRequest(endpoint: "/verify", body: body);
      return data;
    }catch(e){
      throw "Error in verifyPhoneOTP";
    }
  }

  static Future<Map<String, dynamic>> refreshAccessToken(
      {required String refreshToken}) async {
    Map<String, dynamic> body = {"refreshToken": refreshToken};
    var data = await networking.postRequest(endpoint: "/refresh", body: body,customURL: "https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/refresh");
    log("refreshAccessToken $data");
    return data;
  }

  static Future<Map<String, dynamic>> getUserDetails() async {
    var data = await networking.getRequest(endpoint: "/get-customer");
    return data;
  }
  static Future<Map<String, dynamic>> updateUserDetails(
      {
        required String phone,
        required String firstName,
        required String lastName,
        required String email,
      }) async {
    Map<String, dynamic> body = {
      "mobile":phone,
      "firstName": firstName,
      "lastName": lastName,
      "email":email};
    var data = await networking.postRequest(endpoint: "/register", body: body,);
    log("refreshAccessToken $data");
    return data;
  }
  static Future<Map<String, dynamic>> logout(
      {required String refreshToken}) async {
    try{
      Map<String, dynamic> body = {
        "refreshToken": refreshToken,
      };
      var data = await networking.postRequest(endpoint: "/logout", body: body);
      return data;
    }catch(e){
      rethrow;
    }
  }

}
