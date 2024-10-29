import '../../all.dart';
class Order implements IMVCModel{ 
	int? id=0;
	late Voucher voucher;
	late OrderStatus orderStatus;
	Address? deliveryAddress;
	DateTime? orderDateTime;
	late Inventory item;
	late int qty;
	Order({ this.id,required this.voucher,required this.orderStatus, this.deliveryAddress, this.orderDateTime,required this.item,required this.qty});
	Map<String, dynamic> toJson() => {"id":id,"voucher":voucher,"orderStatus":orderStatus,"deliveryAddress":deliveryAddress,"orderDateTime":orderDateTime,"item":item,"qty":qty};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"qty":qty};
	Order.fromJson(Map<String,dynamic> data): id=data["id"],voucher=data["voucher"],orderStatus=data["orderStatus"],deliveryAddress=data["deliveryAddress"],orderDateTime=DateTime.parse(data["orderDateTime"]),item=data["item"],qty=data["qty"];

	Order clone(){return Order.fromJson(this.toJson());}
}
