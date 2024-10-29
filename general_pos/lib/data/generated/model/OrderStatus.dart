import '../../all.dart';
class OrderStatus implements IMVCModel{ 
	int? id=0;
	late String name;
	List<Order>? ListOfOrder_mappedBy_orderStatus;
	OrderStatus({ this.id,required this.name, this.ListOfOrder_mappedBy_orderStatus});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"ListOfOrder_mappedBy_orderStatus":ListOfOrder_mappedBy_orderStatus};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	OrderStatus.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],ListOfOrder_mappedBy_orderStatus=data["ListOfOrder_mappedBy_orderStatus"];

	OrderStatus clone(){return OrderStatus.fromJson(this.toJson());}
}
