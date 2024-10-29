import '../../all.dart';
class Inventory implements IMVCModel{ 
	int? id=0;
	ProductTemplate? productTemplate;
	int qty=0;
	String? SKU;
	String? UPC;
	List<ProductProperty>? productProperties;
	List<ProductPrice>? prices;
	late ProductPrice currentPrice;
	List<Order>? ListOfOrder_mappedBy_item;
	Inventory({ this.id, this.productTemplate,required this.qty, this.SKU, this.UPC, this.productProperties, this.prices,required this.currentPrice, this.ListOfOrder_mappedBy_item});
	Map<String, dynamic> toJson() => {"id":id,"productTemplate":productTemplate,"qty":qty,"SKU":SKU,"UPC":UPC,"productProperties":productProperties,"prices":prices,"currentPrice":currentPrice,"ListOfOrder_mappedBy_item":ListOfOrder_mappedBy_item};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"qty":qty,"SKU":SKU,"UPC":UPC};
	Inventory.fromJson(Map<String,dynamic> data): id=data["id"],productTemplate=data["productTemplate"],qty=data["qty"],SKU=data["SKU"],UPC=data["UPC"],productProperties=data["productProperties"],prices=data["prices"],currentPrice=data["currentPrice"],ListOfOrder_mappedBy_item=data["ListOfOrder_mappedBy_item"];

	Inventory clone(){return Inventory.fromJson(this.toJson());}
}
