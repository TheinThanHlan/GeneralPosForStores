import './ManageCategoryController.dart';
import './ManageCategoryPage.dart';
import 'package:get_it/get_it.dart';

void injectManageCategory(GetIt getIt) {
  getIt.registerSingleton(ManageCategoryPage());
  getIt.registerSingleton(
      ManageCategoryController(view: getIt<ManageCategoryPage>()));
  print("\t~>\tManageCategory injected;");
}
