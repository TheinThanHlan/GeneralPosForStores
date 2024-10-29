import './VoucherHistoryController.dart';
import './VoucherHistoryPage.dart';
import 'package:get_it/get_it.dart';

void injectVoucherHistory(GetIt getIt) {
  getIt.registerSingleton(VoucherHistoryPage());
  getIt.registerSingleton(VoucherHistoryController(view: getIt<VoucherHistoryPage>()));
  print("\t~>\tVoucherHistory injected;");
}
