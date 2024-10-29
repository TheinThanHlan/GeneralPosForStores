import './ManagePropertyNamesController.dart';
import './ManagePropertyNamesPage.dart';
import 'package:get_it/get_it.dart';

void injectManagePropertyNames(GetIt getIt) {
  getIt.registerSingleton(ManagePropertyNamesPage());
  getIt.registerSingleton(ManagePropertyNamesController(view: getIt<ManagePropertyNamesPage>()));
  print("\t~>\tManagePropertyNames injected;");
}
