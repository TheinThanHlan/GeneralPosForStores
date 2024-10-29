import '../../all.dart';
class ProductProvider implements IMVCModel{ 
	int? id=0;
	late User provider;
	late List<ProductTemplate> products;
	double? ratings=0.0;
	ProductProvider({ this.id,required this.provider,required this.products, this.ratings});
	Map<String, dynamic> toJson() => {"id":id,"provider":provider,"products":products,"ratings":ratings};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"ratings":ratings};
	ProductProvider.fromJson(Map<String,dynamic> data): id=data["id"],provider=data["provider"],products=data["products"],ratings=data["ratings"];

	ProductProvider clone(){return ProductProvider.fromJson(this.toJson());}
}
