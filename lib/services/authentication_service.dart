import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  static const String _baseUrl = 'https://yourapi.com';
  Future<bool> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/signin'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        print('Sign-in successful');
        return true;
      } else {
        print('Sign-in failed with status code: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error occurred during sign-in: $error');
      }
      return false;
    }
  }
}
