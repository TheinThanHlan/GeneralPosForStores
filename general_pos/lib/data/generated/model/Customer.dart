import '../../all.dart';
class Customer implements IMVCModel{ 
	int? id=0;
	late User user;
	List<ProductTemplate>? savedProducts;
	List<Order>? autoListOfOrder;
	Customer({ this.id,required this.user, this.savedProducts, this.autoListOfOrder});
	Map<String, dynamic> toJson() => {"id":id,"user":user,"savedProducts":savedProducts,"autoListOfOrder":autoListOfOrder};
	Map<String, dynamic> toJsonWithoutDbAuto() => {};
	Customer.fromJson(Map<String,dynamic> data): id=data["id"],user=data["user"],savedProducts=data["savedProducts"],autoListOfOrder=data["autoListOfOrder"];

}
