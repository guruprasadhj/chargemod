import 'dart:developer';

import 'package:chargemod/configs/secure_storage.dart';
import 'package:chargemod/models/user_details.dart';
import 'package:chargemod/services/login_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/auth_verify_model.dart';
import '../models/update_profile_model.dart';

class AuthProvider extends ChangeNotifier {
  static String _refreshToken = "";
  static String _accessToken = "";
  static String _emailID = "";
  static String _userID = "";
  static String _mobileNumber = "";
  static DateTime? _refreshTime;
  static int _phoneNumber = 0;
  static AuthVerifyModel? _authVerifyModel;
  static UserDetailsModel? _userDetails;
  static User? _user;

  static DateTime? get refreshTime => _refreshTime;

  static String get accessToken => _accessToken;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int get phoneNumber => _phoneNumber;

  AuthVerifyModel? get authVerifyModel => _authVerifyModel;

  UserDetailsModel? get userDetails => _userDetails;

  User? get user => _user;

  updateIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  updateAccessToken(String value) {
    _accessToken = value;
    notifyListeners();
  }

  Future<String?> getAccessToken() async {
    String? refreshTkn = await SecureStorage.getRefreshToken();
    String? accessTkn = await SecureStorage.getaccessToken();
    log("refresh Token :$refreshTkn");
    _accessToken = accessTkn!;
    if (refreshTkn != null) {
      var data =
      await LoginServices.refreshAccessToken(refreshToken: refreshTkn);
      _accessToken = data["data"]["accessToken"];
      print("access token is\n$_accessToken");
      _refreshTime = DateTime.now();
      notifyListeners();

      if (_accessToken.isNotEmpty) return _accessToken;
    }
    throw 'empty-refresh-token';
  }

  Future sendOTP({required int phone}) async {
    updateIsLoading(true);
    _phoneNumber = phone;
    var data = await LoginServices.sendPhoneOTP(phone: phone);
    updateIsLoading(false);
    return data;
  }

  Future resendOTP() async {
    updateIsLoading(true);
    var data = await LoginServices.resendPhoneOTP(phone: _phoneNumber);
    updateIsLoading(false);
    return data;
  }

  Future<AuthVerifyModel?> verifyOTP({required int otp}) async {
    updateIsLoading(true);
    try{
      var data =
          await LoginServices.verifyPhoneOTP(otp: otp, phone: _phoneNumber);
      log("verifyPhoneOTP Data: $data");
      _authVerifyModel = AuthVerifyModel.fromJson(data);
      if (_authVerifyModel!.data!.refreshToken!.isNotEmpty) {
        _refreshToken = _authVerifyModel!.data!.refreshToken!;
        log("_refreshToken:$_refreshToken");
        await SecureStorage.writeRefreshToken(_refreshToken);
      }
      if (_authVerifyModel!.data!.accessToken!.isNotEmpty) {
        _accessToken = _authVerifyModel!.data!.accessToken!;
        log("_accessToken:$_accessToken");
        await SecureStorage.writeAccessToken(_accessToken);
      }
      updateIsLoading(false);
      return _authVerifyModel;
    }catch(e){
      Fluttertoast.showToast(msg: "OTP Failed. Please Retry Again.");
      updateIsLoading(false);
    }
  }

  Future<UserDetailsModel?> getUserDetails() async {
    updateIsLoading(true);
    var data = await LoginServices.getUserDetails();
    _userDetails = UserDetailsModel.fromJson(data);
    if (_userDetails!.data!.user!.isNotEmpty) {
      _user = _userDetails!.data!.user!.first;
      if (_user?.userId != null)
        await SecureStorage.writeUserId("${_user?.userId}");
      if (_user!.email != null)
        await SecureStorage.writeUserEmailId("${_user!.email}");
    }
    updateIsLoading(false);
    return _userDetails;
  }

  Future<UpdateProfileModel?> updateUserDetails({
    required String firstName,
    required String lastName,
    required String email,
  })async{
    updateIsLoading(true);
    var data = await LoginServices.updateUserDetails(phone: "${user!.mobile}",
        firstName: firstName,
        lastName: lastName,
        email: email);
    UpdateProfileModel updateProfileModel = UpdateProfileModel.fromJson(data);
    updateIsLoading(false);
    return updateProfileModel;
  }


  static testing() async {
    SecureStorage.writeRefreshToken(_refreshToken);
    String? refreshTkn = await SecureStorage.getRefreshToken();
    log("refresh Token :$refreshTkn");
    log("access Token :$accessToken");
  }

  static Future<void> logOut() async {
    await SecureStorage.deleteStoredValues();
    LoginServices.logout(refreshToken: _refreshToken);
  }
}
