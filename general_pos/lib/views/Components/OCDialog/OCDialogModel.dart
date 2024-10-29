import 'package:flutter/material.dart';

import '../../../mvc_template/all.dart';

class OCDialogModel implements IMVCModel {
  OCDialogModel(
      {required this.content,
      required this.error_message,
      required this.title,
      required this.ok,
      this.setSelfState,
      this.cancel});
  late final Widget content;
  late final StringBuffer error_message;
  final Function(Function)? setSelfState;
  late final String title;
  Future Function() ok;
  Function()? cancel;
}
