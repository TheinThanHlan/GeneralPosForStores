import '../../../mvc_template/all.dart';
import '../../../data/all.dart';

class PrintVoucherModel implements IMVCModel {
  final Voucher voucher;
  final int totalPrice;
  PrintVoucherModel({required this.voucher, required this.totalPrice});
}
