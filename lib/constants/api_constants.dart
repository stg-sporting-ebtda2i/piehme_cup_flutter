
import 'package:piehme_cup_flutter/services/auth_service.dart';

class ApiConstants {

  static const String baseUrl = 'http://192.168.1.120:9000';
  static const String tokenKey = 'jwttoken';
  static const String nameKey = 'name';

  static const String authEndpoint = '$baseUrl/login';

  static Future<Map<String, String>> header() async {
    final String? token = await AuthService.getToken();
    if (token == null) {
      throw Exception('No authentication token found');
    } else {
      return {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
    }
  }

}