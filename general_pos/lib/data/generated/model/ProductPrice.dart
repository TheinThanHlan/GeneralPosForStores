import '../../all.dart';
class ProductPrice implements IMVCModel{ 
	int? id=0;
	late int price;
	Inventory? autoInventory;
	ProductPrice({ this.id,required this.price, this.autoInventory});
	Map<String, dynamic> toJson() => {"id":id,"price":price,"autoInventory":autoInventory};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"price":price};
	ProductPrice.fromJson(Map<String,dynamic> data): id=data["id"],price=data["price"],autoInventory=data["autoInventory"];

}
