import '../../all.dart';
class Shop implements IMVCModel{ 
	int? id=0;
	DateTime? createdDateTime;
	late String name;
	late User user;
	late ShopType type;
	Shop({ this.id, this.createdDateTime,required this.name,required this.user,required this.type});
	Map<String, dynamic> toJson() => {"id":id,"createdDateTime":createdDateTime,"name":name,"user":user,"type":type};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	Shop.fromJson(Map<String,dynamic> data): id=data["id"],createdDateTime=DateTime.parse(data["createdDateTime"]),name=data["name"],user=data["user"],type=data["type"];

	Shop clone(){return Shop.fromJson(this.toJson());}
}
