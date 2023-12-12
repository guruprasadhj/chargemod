class UserDetailsModel {
  int? statusCode;
  bool? feasibilityStatus;
  String? message;
  Data? data;

  UserDetailsModel(
      {this.statusCode, this.feasibilityStatus, this.message, this.data});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    feasibilityStatus = json['feasibilityStatus'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['feasibilityStatus'] = this.feasibilityStatus;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Null? result;
  List<User>? user;

  Data({this.result, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? sId;
  String? mobile;
  UserType? userType;
  bool? isVerified;
  bool? delFlag;
  String? status;
  List<String>? refreshToken;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? email;
  String? firstName;
  String? lastName;

  User(
      {this.sId,
        this.mobile,
        this.userType,
        this.isVerified,
        this.delFlag,
        this.status,
        this.refreshToken,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.email,
        this.firstName,
        this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mobile = json['mobile'];
    userType = json['userType'] != null
        ? new UserType.fromJson(json['userType'])
        : null;
    isVerified = json['isVerified'];
    delFlag = json['delFlag'];
    status = json['status'];
    refreshToken = json['refreshToken'].cast<String>();
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['mobile'] = this.mobile;
    if (this.userType != null) {
      data['userType'] = this.userType!.toJson();
    }
    data['isVerified'] = this.isVerified;
    data['delFlag'] = this.delFlag;
    data['status'] = this.status;
    data['refreshToken'] = this.refreshToken;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}

class UserType {
  String? sId;
  String? typeName;
  String? description;
  int? startEnergy;
  int? endEnergy;
  bool? isDefaultType;
  bool? isAutoUpgrade;
  bool? delFlag;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserType(
      {this.sId,
        this.typeName,
        this.description,
        this.startEnergy,
        this.endEnergy,
        this.isDefaultType,
        this.isAutoUpgrade,
        this.delFlag,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    typeName = json['typeName'];
    description = json['description'];
    startEnergy = json['startEnergy'];
    endEnergy = json['endEnergy'];
    isDefaultType = json['isDefaultType'];
    isAutoUpgrade = json['isAutoUpgrade'];
    delFlag = json['delFlag'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['typeName'] = this.typeName;
    data['description'] = this.description;
    data['startEnergy'] = this.startEnergy;
    data['endEnergy'] = this.endEnergy;
    data['isDefaultType'] = this.isDefaultType;
    data['isAutoUpgrade'] = this.isAutoUpgrade;
    data['delFlag'] = this.delFlag;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}