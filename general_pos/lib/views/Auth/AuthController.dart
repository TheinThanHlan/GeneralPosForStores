import 'package:flutter/material.dart';

import '../../mvc_template/abstract/MVCController.dart';

class AuthController extends MVCController {
  String greet = "Hello from AuthPage";
  final email = TextEditingController();
  final otp = TextEditingController();
  List<String> signup_states = ["enter_email", "enter_otp"];
  late String signup_state;

  AuthController({required super.view}) {
    signup_state = signup_states[0];
  }
}
