import './ManageProductTemplateController.dart';
import './ManageProductTemplatePage.dart';
import 'package:get_it/get_it.dart';

void injectManageProductTemplate(GetIt getIt) {
  getIt.registerSingleton(ManageProductTemplatePage());
  getIt.registerSingleton(ManageProductTemplateController(view: getIt<ManageProductTemplatePage>()));
  print("\t~>\tManageProductTemplate injected;");
}
