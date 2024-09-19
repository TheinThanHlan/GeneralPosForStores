import '../../all.dart';
class Order implements IMVCModel{ 
	int? id=0;
	late Customer customer;
	late OrderStatus orderStatus;
	double totalPrice=0.0;
	late Address deliveryAddress;
	late DateTime orderDate;
	late List<Inventory> items;
	Order({ this.id,required this.customer,required this.orderStatus,required this.totalPrice,required this.deliveryAddress,required this.orderDate,required this.items});
	Map<String, dynamic> toJson() => {"id":id,"customer":customer,"orderStatus":orderStatus,"totalPrice":totalPrice,"deliveryAddress":deliveryAddress,"orderDate":orderDate,"items":items};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"totalPrice":totalPrice,"orderDate":orderDate,"items":items};
	Order.fromJson(Map<String,dynamic> data): id=data["id"],customer=data["customer"],orderStatus=data["orderStatus"],totalPrice=data["totalPrice"],deliveryAddress=data["deliveryAddress"],orderDate=DateTime.parse(data["orderDate"]),items=data["items"];

}
