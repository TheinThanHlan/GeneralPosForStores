import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'mvc_template/all.dart';

void main() {
  init();

  getIt.allReady().then((x) {
    MaterialApp mainApp = MaterialApp.router(
      useInheritedMediaQuery: true,
      routerConfig: getIt<GoRouter>(),
    );
    runApp(
      //mainApp
      DevicePreview(builder: (context) => mainApp),
    );
  });
}
