import '../../all.dart';
class ServingTable implements IMVCModel{ 
	int? id=0;
	late String name;
	List<Voucher>? ListOfVoucher_mappedBy_table;
	ServingTable({ this.id,required this.name, this.ListOfVoucher_mappedBy_table});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"ListOfVoucher_mappedBy_table":ListOfVoucher_mappedBy_table};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	ServingTable.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],ListOfVoucher_mappedBy_table=data["ListOfVoucher_mappedBy_table"];

	ServingTable clone(){return ServingTable.fromJson(this.toJson());}
}
