import '../../all.dart';
class OrderStatus implements IMVCModel{ 
	int? id=0;
	late String name;
	List<Order>? autoListOfOrder;
	OrderStatus({ this.id,required this.name, this.autoListOfOrder});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"autoListOfOrder":autoListOfOrder};
	Map<String, dynamic> toJsonWithoutDbAuto() => {};
	OrderStatus.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],autoListOfOrder=data["autoListOfOrder"];

}
