import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class UserService {
  static const String baseUrl = 'https://your-backend-api.com/users';

  Future<UserModel?> getUser(String userId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$userId'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = json.decode(response.body);
        return UserModel.fromJson(userData);
      } else {
        // Handle other status codes or errors
        return null;
      }
    } catch (e) {
      // Handle network errors
      return null;
    }
  }
}
