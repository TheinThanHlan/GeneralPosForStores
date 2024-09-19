import 'package:flutter/material.dart';
import 'package:general_pos/views/Auth/Components/Otp.dart';
import 'package:general_pos/views/Auth/Components/Signin.dart';
import '../../mvc_template/interface/IMVCView.dart';
import './AuthController.dart';

class AuthPage extends StatefulWidget implements IMVCView {
  late final AuthController controller;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
              padding: EdgeInsets.all(20),
              child: widget.controller.signup_state ==
                      widget.controller.signup_states[0]
                  ? Signin(email: widget.controller.email)
                  : Otp(otp: widget.controller.otp)),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
