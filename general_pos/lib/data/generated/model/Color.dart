import '../../all.dart';
class Color implements IMVCModel{ 
	int? id=0;
	late String name;
	late String code;
	Inventory? autoInventory;
	Color({ this.id,required this.name,required this.code, this.autoInventory});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"code":code,"autoInventory":autoInventory};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name,"code":code};
	Color.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],code=data["code"],autoInventory=data["autoInventory"];

}
