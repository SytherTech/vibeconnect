import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:vibeconnect/model/user_model.dart';
import 'package:vibeconnect/utils/userdata.dart';
=======
import 'package:vibe_connect/model/user_model.dart';
import 'package:vibe_connect/utils/userdata.dart';
>>>>>>> abidev

class UserController with ChangeNotifier {
  UserModel _userModel = UserModel();

  UserModel get userModel => _userModel;

  void getUserData() {
    _userModel = UserData().users[0];
  }
}
