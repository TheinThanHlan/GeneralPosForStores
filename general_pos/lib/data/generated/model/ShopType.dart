import '../../all.dart';
class ShopType implements IMVCModel{ 
	int? id=0;
	late String type;
	List<Shop>? autoListOfShop;
	ShopType({ this.id,required this.type, this.autoListOfShop});
	Map<String, dynamic> toJson() => {"id":id,"type":type,"autoListOfShop":autoListOfShop};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"type":type};
	ShopType.fromJson(Map<String,dynamic> data): id=data["id"],type=data["type"],autoListOfShop=data["autoListOfShop"];

}
