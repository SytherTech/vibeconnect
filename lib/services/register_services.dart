import 'dart:io';

import 'package:http/http.dart' as http;

import '../views/auth/register_view.dart';

class RegistrationService {
  static const String _baseUrl =
      'https://yourapi.com'; // Replace with your API base URL

  Future<bool> registerUser(
    String name,
    String email,
    String password,
    int age,
    Gender selectedGender,
    File? image,
  ) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseUrl/register'),
      );

      request.fields.addAll({
        'name': name,
        'email': email,
        'password': password,
        'age': age.toString(),
        'gender': selectedGender.toString(),
      });

      if (image != null) {
        var fileStream = http.ByteStream(image.openRead());
        var length = await image.length();
        var multipartFile = http.MultipartFile('image', fileStream, length,
            filename: image.path.split('/').last);
        request.files.add(multipartFile);
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        // Successful registration
        print('Registration successful');
        return true;
      } else {
        // Handle registration failure
        print('Registration failed with status code: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle other errors like network issues
      print('Error occurred during registration: $error');
      return false;
    }
  }
}
