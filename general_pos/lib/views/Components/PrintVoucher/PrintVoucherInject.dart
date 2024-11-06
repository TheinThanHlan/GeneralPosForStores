import './PrintVoucherComponent.dart';
import './PrintVoucherModel.dart';
import 'package:get_it/get_it.dart';

void injectPrintVoucher(GetIt getIt) {
  getIt.registerFactoryParam<PrintVoucherComponent, PrintVoucherModel, void>(
      (p1, p2) => PrintVoucherComponent(data: p1));
  print("\t~>\tPrintVoucher injected;");
}
