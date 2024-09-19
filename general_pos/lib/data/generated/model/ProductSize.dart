import '../../all.dart';
class ProductSize implements IMVCModel{ 
	int? id=0;
	late String size;
	List<ProductCategory>? productCategories;
	Inventory? autoInventory;
	ProductSize({ this.id,required this.size, this.productCategories, this.autoInventory});
	Map<String, dynamic> toJson() => {"id":id,"size":size,"productCategories":productCategories,"autoInventory":autoInventory};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"size":size};
	ProductSize.fromJson(Map<String,dynamic> data): id=data["id"],size=data["size"],productCategories=data["productCategories"],autoInventory=data["autoInventory"];

}
