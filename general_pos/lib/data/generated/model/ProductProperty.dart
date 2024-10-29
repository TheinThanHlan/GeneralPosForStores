import '../../all.dart';
class ProductProperty implements IMVCModel{ 
	int? id=0;
	late ProductPropertyName productPropertyName;
	late String value;
	List<Inventory>? ListOfInventory_mappedBy_productProperties;
	ProductProperty({ this.id,required this.productPropertyName,required this.value, this.ListOfInventory_mappedBy_productProperties});
	Map<String, dynamic> toJson() => {"id":id,"productPropertyName":productPropertyName,"value":value,"ListOfInventory_mappedBy_productProperties":ListOfInventory_mappedBy_productProperties};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"value":value};
	ProductProperty.fromJson(Map<String,dynamic> data): id=data["id"],productPropertyName=data["productPropertyName"],value=data["value"],ListOfInventory_mappedBy_productProperties=data["ListOfInventory_mappedBy_productProperties"];

	ProductProperty clone(){return ProductProperty.fromJson(this.toJson());}
}
