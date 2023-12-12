class AuthVerifyModel {
  int? statusCode;
  bool? feasibilityStatus;
  String? message;
  Data? data;

  AuthVerifyModel(
      {this.statusCode, this.feasibilityStatus, this.message, this.data});

  AuthVerifyModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    feasibilityStatus = json['feasibilityStatus'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['feasibilityStatus'] = feasibilityStatus;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? refreshToken;
  bool? isNewUser;
  String? userId;

  Data({this.accessToken, this.refreshToken, this.isNewUser, this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    isNewUser = json['isNewUser'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['isNewUser'] = isNewUser;
    data['userId'] = userId;
    return data;
  }
}