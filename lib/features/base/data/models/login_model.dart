// To parse this JSON data, do
//
//     final LoginModel = LoginModelFromJson(jsonString);

import 'dart:convert';

LoginModel LoginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? status;
  String? token;
  User? user;

  LoginModel({
    this.status,
    this.token,
    this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "user": user?.toJson(),
      };
}

class User {
  String? googleId;
  String? gender;
  String? firstName;
  String? lastName;
  int? age;
  String? locale;
  String? email;
  String? password;
  String? picUrl;
  DateTime? signupAt;
  dynamic signinAt;
  String? platform;
  String? signupType;
  String? deviceId;
  bool? isPremium;
  dynamic premiumExpiration;
  String? userType;
  DateTime? emailVerifiedAt;
  bool? isVerified;
  int? userId;
  DateTime? updatedAt;
  DateTime? createdAt;
  String? id;

  User({
    this.googleId,
    this.gender,
    this.firstName,
    this.lastName,
    this.age,
    this.locale,
    this.email,
    this.password,
    this.picUrl,
    this.signupAt,
    this.signinAt,
    this.platform,
    this.signupType,
    this.deviceId,
    this.isPremium,
    this.premiumExpiration,
    this.userType,
    this.emailVerifiedAt,
    this.isVerified,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        googleId: json["google_id"],
        gender: json["gender"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        age: json["age"],
        locale: json["locale"],
        email: json["email"],
        password: json["password"],
        picUrl: json["pic_URL"],
        signupAt: json["signup_at"] == null
            ? null
            : DateTime.parse(json["signup_at"]),
        signinAt: json["signin_at"],
        platform: json["platform"],
        signupType: json["signup_type"],
        deviceId: json["device_id"],
        isPremium: json["is_premium"],
        premiumExpiration: json["premium_expiration"],
        userType: json["user_type"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        isVerified: json["is_verified"],
        userId: json["user_id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "google_id": googleId,
        "gender": gender,
        "first_name": firstName,
        "last_name": lastName,
        "age": age,
        "locale": locale,
        "email": email,
        "password": password,
        "pic_URL": picUrl,
        "signup_at": signupAt?.toIso8601String(),
        "signin_at": signinAt,
        "platform": platform,
        "signup_type": signupType,
        "device_id": deviceId,
        "is_premium": isPremium,
        "premium_expiration": premiumExpiration,
        "user_type": userType,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "is_verified": isVerified,
        "user_id": userId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
