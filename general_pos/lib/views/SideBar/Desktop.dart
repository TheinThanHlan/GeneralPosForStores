import 'package:flutter/material.dart';
import '../../mvc_template/all.dart';
import './SideBarController.dart';

class Desktop extends StatelessWidget {
  late final SideBarController controller;
  Desktop({required this.controller});

  Widget build(BuildContext context) {
    return Text(controller.greet);
  }

//  State<StatefulWidget> createState() {
//    return _Desktop();
//  }
}

//class _Desktop extends State<Desktop> {
//  @override
//  Widget build(BuildContext context) {
//    return Text(widget.controller.greet);
//  }
//}
