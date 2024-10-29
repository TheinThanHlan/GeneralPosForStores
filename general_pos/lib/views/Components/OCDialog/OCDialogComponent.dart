import 'package:flutter/material.dart';
import './OCDialogModel.dart';
import '../../../mvc_template/all.dart';
import './Mobile.dart';
import './Desktop.dart';
import './Tablet.dart';

class OCDialogComponent extends StatelessWidget {
  late OCDialogModel data;
  OCDialogComponent setData(OCDialogModel data) {
    this.data = data;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return responsiveLayout(
        context: context,
        desktop: Desktop(data: this.data),
        mobile: Mobile(data: this.data),
        tablet: Tablet(data: this.data));
  }
}
