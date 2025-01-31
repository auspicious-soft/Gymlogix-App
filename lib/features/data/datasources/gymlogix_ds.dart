import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gymlogix/features/data/models/login_model.dart';
import 'package:http/http.dart' as http;

class RemoteDs {
  RemoteDs();
  // ignore: non_constant_identifier_names
  final _BASE_URL = "http://18.232.174.110/api/";
  Future<dynamic> loginToGymlox(
      {required String email, required String pass}) async {
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "email": email,
      "password": pass,
    });

    final response = await http.post(
      Uri.parse('${_BASE_URL}user/signin'),
      headers: headers,
      body: body,
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final obj = LoginModel.fromJson(jsonDecode(response.body));

      return obj;
    } else {
      // Map<String, dynamic> responseData = jsonDecode(response.body);
      // print("body ${responseData["reason"]}");
      final reason = handleError(response.body);
      if (reason.isEmpty) {
        throw Exception("unable to reach now.");
      }
      throw Exception(reason);
    }
  }

String handleError(String jsonString){
 Map<String, dynamic> responseData = jsonDecode(jsonString);
     // print("body ${responseData["reason"]}");
      final reason = responseData["reason"] as String;
      if (reason.isEmpty) {
       return "unable to reach now.";
      }
      return  reason;
}

  Future<String> getToken() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final fullToken = await secureStorage.read(key: 'token');
    return fullToken ?? "";
  }

  Future<dynamic> getPlanData({
    required String token,
  }) async {
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    // final body = json.encode({
    //   "email": email,
    //   "password": pass,
    // });

    final response = await http.post(
      Uri.parse('$_BASE_URL/plan/get'),
      headers: headers,
      // body: body,
    );
   // print(response.body);

    if (response.statusCode == 200) {
      final obj = LoginModel.fromJson(jsonDecode(response.body));

      return obj;
    } else {
      throw Exception('Faild to login');
    }
  }
}
