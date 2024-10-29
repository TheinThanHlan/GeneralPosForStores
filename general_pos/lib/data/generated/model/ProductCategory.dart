import '../../all.dart';
class ProductCategory implements IMVCModel{ 
	int? id=0;
	late String name;
	ProductCategory? parentProductCategory;
	List<ProductTemplate>? ListOfProductTemplate_mappedBy_categories;
	List<ProductCategory>? ListOfProductCategory_mappedBy_parentProductCategory;
	ProductCategory({ this.id,required this.name, this.parentProductCategory, this.ListOfProductTemplate_mappedBy_categories, this.ListOfProductCategory_mappedBy_parentProductCategory});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"parentProductCategory":parentProductCategory,"ListOfProductTemplate_mappedBy_categories":ListOfProductTemplate_mappedBy_categories,"ListOfProductCategory_mappedBy_parentProductCategory":ListOfProductCategory_mappedBy_parentProductCategory};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	ProductCategory.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],parentProductCategory=data["parentProductCategory"],ListOfProductTemplate_mappedBy_categories=data["ListOfProductTemplate_mappedBy_categories"],ListOfProductCategory_mappedBy_parentProductCategory=data["ListOfProductCategory_mappedBy_parentProductCategory"];

	ProductCategory clone(){return ProductCategory.fromJson(this.toJson());}
}
