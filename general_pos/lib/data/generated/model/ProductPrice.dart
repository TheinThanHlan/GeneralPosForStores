import '../../all.dart';
class ProductPrice implements IMVCModel{ 
	int? id=0;
	DateTime? createdDateTime;
	late int price;
	Inventory? Inventory_mappedBy_prices;
	ProductPrice({ this.id, this.createdDateTime,required this.price, this.Inventory_mappedBy_prices});
	Map<String, dynamic> toJson() => {"id":id,"createdDateTime":createdDateTime,"price":price,"Inventory_mappedBy_prices":Inventory_mappedBy_prices};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"price":price};
	ProductPrice.fromJson(Map<String,dynamic> data): id=data["id"],createdDateTime=DateTime.parse(data["createdDateTime"]),price=data["price"],Inventory_mappedBy_prices=data["Inventory_mappedBy_prices"];

	ProductPrice clone(){return ProductPrice.fromJson(this.toJson());}
}
