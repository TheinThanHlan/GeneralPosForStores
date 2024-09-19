import '../../all.dart';
class Inventory implements IMVCModel{ 
	int? id=0;
	late ProductTemplate productTemplate;
	int qty=0;
	List<ProductSize>? productSizes;
	List<Color>? colors;
	List<ProductPrice>? prices;
	late ProductPrice currentPrice;
	Inventory({ this.id,required this.productTemplate,required this.qty, this.productSizes, this.colors, this.prices,required this.currentPrice});
	Map<String, dynamic> toJson() => {"id":id,"productTemplate":productTemplate,"qty":qty,"productSizes":productSizes,"colors":colors,"prices":prices,"currentPrice":currentPrice};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"qty":qty};
	Inventory.fromJson(Map<String,dynamic> data): id=data["id"],productTemplate=data["productTemplate"],qty=data["qty"],productSizes=data["productSizes"],colors=data["colors"],prices=data["prices"],currentPrice=data["currentPrice"];

}
