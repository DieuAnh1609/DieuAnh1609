import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:app_datdoanonline/models/auth/login_request.dart';
import 'package:app_datdoanonline/models/auth/login_response.dart';
import 'package:app_datdoanonline/models/auth/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static const String baseUrl = 'https://dummyjson.com/auth';

  static Dio dio = Dio();
  static Future<LoginResponse?> login(LoginRequest loginRequest) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var data = loginRequest.toJson();

      var response = await dio.post(
        '$baseUrl/login',
        data: data,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        return LoginResponse.fromJson(response.data);
      } else {
        print('Error: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      print('Login request failed: $e');
      return null;
    }
  }

  static Future<User?> getCurrentUser(String accessToken) async {
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response = await dio.get(
        '$baseUrl/me',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        return User.fromJson(response.data);
      } else {
        print('Error: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
      return null;
    }
  }
  static Future<void> logout() async {
    try {
      // Xóa token khỏi SharedPreferences (hoặc phương thức lưu trữ khác)
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('accessToken'); // Giả sử bạn đã lưu token ở đây

      print('User logged out successfully');
    } catch (e) {
      print('Logout failed: $e');
    }
  }
}
  

