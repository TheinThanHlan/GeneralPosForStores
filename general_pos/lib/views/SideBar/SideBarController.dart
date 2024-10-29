import 'package:flutter/material.dart';
import 'package:general_pos/mvc_template/injection_container.dart';
import 'package:general_pos/views/Manage/ManagePage.dart';
import "package:general_pos/views/Sales/SalesPage.dart";
import "package:general_pos/views/VoucherHistory/VoucherHistoryPage.dart";

import '../../mvc_template/abstract/MVCController.dart';

class SideBarController extends MVCController {
  String greet = "Hello from SideBarPage";

  SideBarController({required super.view}) {
    currentPage = this.pages[0];
  }
  Map<String, dynamic> currentPage = {};

  bool isMenuFold = true;

  List<dynamic> pages = [
    //{"name": "tmp", "icon": Icons.exit_to_app, "page": getIt<SalesPage>()},
    {"name": "Sell", "icon": Icons.sell, "page": getIt<SalesPage>()},
    {
      "name": "Manage",
      "icon": Icons.manage_accounts,
      "page": getIt<ManagePage>()
    },
    {
      "name": "Vouchers",
      "icon": Icons.history_edu,
      "page": getIt<VoucherHistoryPage>()
    },
  ];
}
