import '../../all.dart';
class Delivery implements IMVCModel{ 
	int? id=0;
	double? rating=0.0;
	late DeliveryMethod deliveryMethod;
	Delivery({ this.id, this.rating,required this.deliveryMethod});
	Map<String, dynamic> toJson() => {"id":id,"rating":rating,"deliveryMethod":deliveryMethod};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"rating":rating};
	Delivery.fromJson(Map<String,dynamic> data): id=data["id"],rating=data["rating"],deliveryMethod=data["deliveryMethod"];

}
