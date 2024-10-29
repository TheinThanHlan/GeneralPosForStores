import './SalesController.dart';
import './SalesPage.dart';
import 'package:get_it/get_it.dart';

void injectSales(GetIt getIt) {
  getIt.registerSingleton(SalesPage());
  getIt.registerSingleton(SalesController(view: getIt<SalesPage>()));
  print("\t~>\tSales injected;");
}
