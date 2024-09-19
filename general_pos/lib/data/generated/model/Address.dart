import '../../all.dart';
class Address implements IMVCModel{ 
	int? id=0;
	late String address;
	double? latitude=0.0;
	double? longitude=0.0;
	List<Order>? autoListOfOrder;
	User? autoUser;
	Address({ this.id,required this.address, this.latitude, this.longitude, this.autoListOfOrder, this.autoUser});
	Map<String, dynamic> toJson() => {"id":id,"address":address,"latitude":latitude,"longitude":longitude,"autoListOfOrder":autoListOfOrder,"autoUser":autoUser};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"address":address,"latitude":latitude,"longitude":longitude};
	Address.fromJson(Map<String,dynamic> data): id=data["id"],address=data["address"],latitude=data["latitude"],longitude=data["longitude"],autoListOfOrder=data["autoListOfOrder"],autoUser=data["autoUser"];

}
