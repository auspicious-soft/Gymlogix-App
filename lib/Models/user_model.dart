class UserModel {
  final String token;
  final Map<String, dynamic> user;

  UserModel({required this.token, required this.user});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      user: json['user'],
    );
  }
}
