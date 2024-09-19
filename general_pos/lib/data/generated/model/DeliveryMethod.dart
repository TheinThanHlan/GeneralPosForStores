import '../../all.dart';
class DeliveryMethod implements IMVCModel{ 
	int? id=0;
	double? name=0.0;
	List<Delivery>? autoListOfDelivery;
	DeliveryMethod({ this.id, this.name, this.autoListOfDelivery});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"autoListOfDelivery":autoListOfDelivery};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name};
	DeliveryMethod.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],autoListOfDelivery=data["autoListOfDelivery"];

}
