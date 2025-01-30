import 'dart:convert';
import 'package:gymlogix/app_settings/constants/app_config.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = AppConfig.apiBaseUrl;
  static Future<dynamic> request(
    String endpoint, {
    String method = 'GET',
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final String url = '$_baseUrl$endpoint';
      // Set default headers
      final Map<String, String> defaultHeaders = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      };

      // Combine default headers with custom headers
      final Map<String, String> finalHeaders = {
        ...defaultHeaders,
        if (headers != null) ...headers,
      };

      // Choose HTTP method
      late http.Response response;
      if (method.toUpperCase() == 'POST') {
        response = await http.post(
          Uri.parse(url),
          headers: finalHeaders,
          body: body != null ? jsonEncode(body) : null,
        );
      } else if (method.toUpperCase() == 'PUT') {
        response = await http.put(
          Uri.parse(url),
          headers: finalHeaders,
          body: body != null ? jsonEncode(body) : null,
        );
      } else if (method.toUpperCase() == 'DELETE') {
        response = await http.delete(
          Uri.parse(url),
          headers: finalHeaders,
          body: body != null ? jsonEncode(body) : null,
        );
      } else {
        // Default to GET
        response = await http.get(
          Uri.parse(url),
          headers: finalHeaders,
        );
      }

      // Check for success response
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body); // Return decoded JSON
      } else {
        throw Exception(
            'Error: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      throw Exception('API Request Failed: $e');
    }
  }
}
