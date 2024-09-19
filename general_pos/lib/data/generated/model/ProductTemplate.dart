import '../../all.dart';
class ProductTemplate implements IMVCModel{ 
	int? id=0;
	late String name;
	String? SKU;
	String? UPC;
	String? description;
	List<ProductCategory>? categories;
	List<ProductProvider>? autoListOfProductProvider;
	List<Inventory>? autoListOfInventory;
	Customer? autoCustomer;
	ProductTemplate({ this.id,required this.name, this.SKU, this.UPC, this.description, this.categories, this.autoListOfProductProvider, this.autoListOfInventory, this.autoCustomer});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"SKU":SKU,"UPC":UPC,"description":description,"categories":categories,"autoListOfProductProvider":autoListOfProductProvider,"autoListOfInventory":autoListOfInventory,"autoCustomer":autoCustomer};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name,"SKU":SKU,"UPC":UPC,"description":description};
	ProductTemplate.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],SKU=data["SKU"],UPC=data["UPC"],description=data["description"],categories=data["categories"],autoListOfProductProvider=data["autoListOfProductProvider"],autoListOfInventory=data["autoListOfInventory"],autoCustomer=data["autoCustomer"];

}
