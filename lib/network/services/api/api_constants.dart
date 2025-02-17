class ApiConstants {
  static ApiConstants? _instance;

  static ApiConstants get instance => _instance ??= ApiConstants._init();

  ApiConstants._init();

  static const login = 'user/signin';
}
