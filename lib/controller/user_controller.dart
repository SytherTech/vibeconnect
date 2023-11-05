import 'package:flutter/material.dart';
import 'package:vibeconnect/model/user_model.dart';
import 'package:vibeconnect/utils/userdata.dart';

class UserController with ChangeNotifier {
  UserModel _userModel = UserModel();

  UserModel get userModel => _userModel;

  void getUserData() {
    _userModel = UserData().users[0];
  }
}
