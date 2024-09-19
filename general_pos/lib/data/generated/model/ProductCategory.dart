import '../../all.dart';
class ProductCategory implements IMVCModel{ 
	int? id=0;
	late String name;
	late ProductCategoryType categoryType;
	List<ProductTemplate>? autoListOfProductTemplate;
	ProductSize? autoProductSize;
	ProductCategory({ this.id,required this.name,required this.categoryType, this.autoListOfProductTemplate, this.autoProductSize});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"categoryType":categoryType,"autoListOfProductTemplate":autoListOfProductTemplate,"autoProductSize":autoProductSize};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	ProductCategory.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],categoryType=data["categoryType"],autoListOfProductTemplate=data["autoListOfProductTemplate"],autoProductSize=data["autoProductSize"];

}
