import './SideBarController.dart';
import './SideBarPage.dart';
import 'package:get_it/get_it.dart';

void injectSideBar(GetIt getIt) {
  getIt.registerSingleton(SideBarPage());
  getIt.registerSingleton(SideBarController(view: getIt<SideBarPage>()));
  print("\t~>\tSideBar injected;");
}
