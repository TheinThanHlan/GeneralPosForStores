import '../../all.dart';
class ProductCategoryType implements IMVCModel{ 
	int? id=0;
	late String name;
	List<ProductCategory>? autoListOfProductCategory;
	ProductCategoryType({ this.id,required this.name, this.autoListOfProductCategory});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"autoListOfProductCategory":autoListOfProductCategory};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	ProductCategoryType.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],autoListOfProductCategory=data["autoListOfProductCategory"];

}
