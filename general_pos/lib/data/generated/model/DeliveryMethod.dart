import '../../all.dart';
class DeliveryMethod implements IMVCModel{ 
	int? id=0;
	double? name=0.0;
	List<Delivery>? ListOfDelivery_mappedBy_deliveryMethod;
	DeliveryMethod({ this.id, this.name, this.ListOfDelivery_mappedBy_deliveryMethod});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"ListOfDelivery_mappedBy_deliveryMethod":ListOfDelivery_mappedBy_deliveryMethod};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	DeliveryMethod.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],ListOfDelivery_mappedBy_deliveryMethod=data["ListOfDelivery_mappedBy_deliveryMethod"];

	DeliveryMethod clone(){return DeliveryMethod.fromJson(this.toJson());}
}
