import '../../all.dart';
class VoucherStatus implements IMVCModel{ 
	int? id=0;
	late String name;
	List<Voucher>? ListOfVoucher_mappedBy_status;
	VoucherStatus({ this.id,required this.name, this.ListOfVoucher_mappedBy_status});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"ListOfVoucher_mappedBy_status":ListOfVoucher_mappedBy_status};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	VoucherStatus.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],ListOfVoucher_mappedBy_status=data["ListOfVoucher_mappedBy_status"];

	VoucherStatus clone(){return VoucherStatus.fromJson(this.toJson());}
}
