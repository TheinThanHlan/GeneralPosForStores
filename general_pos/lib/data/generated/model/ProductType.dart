import '../../all.dart';
class ProductType implements IMVCModel{ 
	int? id=0;
	late String name;
	ProductType({ this.id,required this.name});
	Map<String, dynamic> toJson() => {"id":id,"name":name};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	ProductType.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"];

}
