import './OCDialogComponent.dart';
import './OCDialogModel.dart';
import 'package:get_it/get_it.dart';

void injectOCDialog(GetIt getIt) {
  getIt.registerSingleton(OCDialogComponent());
  print("\t~>\tOCDialog injected;");
}
