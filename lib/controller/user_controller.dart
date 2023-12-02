import 'package:flutter/material.dart';
import '../../../model/user_model.dart';
import '../../../utils/userdata.dart';

class UserController with ChangeNotifier {
  UserModel _userModel = UserModel();

  UserModel get userModel => _userModel;

  void getUserData() {
    _userModel = UserData().users[0];
  }
}
