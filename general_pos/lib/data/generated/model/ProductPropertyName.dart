import '../../all.dart';
class ProductPropertyName implements IMVCModel{ 
	int? id=0;
	late String name;
	List<ProductProperty>? ListOfProductProperty_mappedBy_productPropertyName;
	ProductPropertyName({ this.id,required this.name, this.ListOfProductProperty_mappedBy_productPropertyName});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"ListOfProductProperty_mappedBy_productPropertyName":ListOfProductProperty_mappedBy_productPropertyName};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	ProductPropertyName.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],ListOfProductProperty_mappedBy_productPropertyName=data["ListOfProductProperty_mappedBy_productPropertyName"];

	ProductPropertyName clone(){return ProductPropertyName.fromJson(this.toJson());}
}
