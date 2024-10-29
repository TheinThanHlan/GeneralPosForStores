import '../../all.dart';
class ShopType implements IMVCModel{ 
	int? id=0;
	late String type;
	List<Shop>? ListOfShop_mappedBy_type;
	ShopType({ this.id,required this.type, this.ListOfShop_mappedBy_type});
	Map<String, dynamic> toJson() => {"id":id,"type":type,"ListOfShop_mappedBy_type":ListOfShop_mappedBy_type};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"type":type};
	ShopType.fromJson(Map<String,dynamic> data): id=data["id"],type=data["type"],ListOfShop_mappedBy_type=data["ListOfShop_mappedBy_type"];

	ShopType clone(){return ShopType.fromJson(this.toJson());}
}
