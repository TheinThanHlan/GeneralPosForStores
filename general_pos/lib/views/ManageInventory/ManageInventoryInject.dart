import './ManageInventoryController.dart';
import './ManageInventoryPage.dart';
import 'package:get_it/get_it.dart';

void injectManageInventory(GetIt getIt) {
  getIt.registerSingleton(ManageInventoryPage());
  getIt.registerSingleton(ManageInventoryController(view: getIt<ManageInventoryPage>()));
  print("\t~>\tManageInventory injected;");
}
