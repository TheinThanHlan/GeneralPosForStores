import './ManageController.dart';
import './ManagePage.dart';
import 'package:get_it/get_it.dart';

void injectManage(GetIt getIt) {
  getIt.registerSingleton(ManagePage());
  getIt.registerSingleton(ManageController(view: getIt<ManagePage>()));
  print("\t~>\tManage injected;");
}
