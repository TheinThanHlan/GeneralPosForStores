import '../../all.dart';
class Customer implements IMVCModel{ 
	int? id=0;
	late User user;
	List<ProductTemplate>? savedProducts;
	List<Voucher>? ListOfVoucher_mappedBy_customer;
	Customer({ this.id,required this.user, this.savedProducts, this.ListOfVoucher_mappedBy_customer});
	Map<String, dynamic> toJson() => {"id":id,"user":user,"savedProducts":savedProducts,"ListOfVoucher_mappedBy_customer":ListOfVoucher_mappedBy_customer};
	Map<String, dynamic> toJsonWithoutDbAuto() => {};
	Customer.fromJson(Map<String,dynamic> data): id=data["id"],user=data["user"],savedProducts=data["savedProducts"],ListOfVoucher_mappedBy_customer=data["ListOfVoucher_mappedBy_customer"];

	Customer clone(){return Customer.fromJson(this.toJson());}
}
