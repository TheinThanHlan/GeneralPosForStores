import './ManageTableController.dart';
import './ManageTablePage.dart';
import 'package:get_it/get_it.dart';

void injectManageTable(GetIt getIt) {
  getIt.registerSingleton(ManageTablePage());
  getIt.registerSingleton(ManageTableController(view: getIt<ManageTablePage>()));
  print("\t~>\tManageTable injected;");
}
