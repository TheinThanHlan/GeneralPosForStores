import '../../all.dart';
class ProductTemplate implements IMVCModel{ 
	int? id=0;
	late String name;
	String? description;
	List<ProductCategory>? categories;
	List<ProductProvider>? ListOfProductProvider_mappedBy_products;
	List<Inventory>? ListOfInventory_mappedBy_productTemplate;
	Customer? Customer_mappedBy_savedProducts;
	ProductTemplate({ this.id,required this.name, this.description, this.categories, this.ListOfProductProvider_mappedBy_products, this.ListOfInventory_mappedBy_productTemplate, this.Customer_mappedBy_savedProducts});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"description":description,"categories":categories,"ListOfProductProvider_mappedBy_products":ListOfProductProvider_mappedBy_products,"ListOfInventory_mappedBy_productTemplate":ListOfInventory_mappedBy_productTemplate,"Customer_mappedBy_savedProducts":Customer_mappedBy_savedProducts};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name,"description":description};
	ProductTemplate.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],description=data["description"],categories=data["categories"],ListOfProductProvider_mappedBy_products=data["ListOfProductProvider_mappedBy_products"],ListOfInventory_mappedBy_productTemplate=data["ListOfInventory_mappedBy_productTemplate"],Customer_mappedBy_savedProducts=data["Customer_mappedBy_savedProducts"];

	ProductTemplate clone(){return ProductTemplate.fromJson(this.toJson());}
}
