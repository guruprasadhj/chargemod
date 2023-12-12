class UpdateProfileModel {
  String? sId;
  String? mobile;
  String? userType;
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

  UpdateProfileModel(
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

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mobile = json['mobile'];
    userType = json['userType'];
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
    data['userType'] = this.userType;
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