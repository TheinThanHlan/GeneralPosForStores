import '../../all.dart';
class Address implements IMVCModel{ 
	int? id=0;
	late String address;
	double? latitude=0.0;
	double? longitude=0.0;
	List<Order>? ListOfOrder_mappedBy_deliveryAddress;
	List<Voucher>? ListOfVoucher_mappedBy_deliveryAddress;
	User? User_mappedBy_addresses;
	Address({ this.id,required this.address, this.latitude, this.longitude, this.ListOfOrder_mappedBy_deliveryAddress, this.ListOfVoucher_mappedBy_deliveryAddress, this.User_mappedBy_addresses});
	Map<String, dynamic> toJson() => {"id":id,"address":address,"latitude":latitude,"longitude":longitude,"ListOfOrder_mappedBy_deliveryAddress":ListOfOrder_mappedBy_deliveryAddress,"ListOfVoucher_mappedBy_deliveryAddress":ListOfVoucher_mappedBy_deliveryAddress,"User_mappedBy_addresses":User_mappedBy_addresses};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"address":address,"latitude":latitude,"longitude":longitude};
	Address.fromJson(Map<String,dynamic> data): id=data["id"],address=data["address"],latitude=data["latitude"],longitude=data["longitude"],ListOfOrder_mappedBy_deliveryAddress=data["ListOfOrder_mappedBy_deliveryAddress"],ListOfVoucher_mappedBy_deliveryAddress=data["ListOfVoucher_mappedBy_deliveryAddress"],User_mappedBy_addresses=data["User_mappedBy_addresses"];

	Address clone(){return Address.fromJson(this.toJson());}
}
