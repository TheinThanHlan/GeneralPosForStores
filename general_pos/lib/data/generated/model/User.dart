import '../../all.dart';
class User implements IMVCModel{ 
	int? id=0;
	late String name;
	String? socialSecurityNumber;
	String? driverLicense;
	late String email;
	List<PhoneNumber>? phones;
	List<Address>? addresses;
	List<Shop>? autoListOfShop;
	User({ this.id,required this.name, this.socialSecurityNumber, this.driverLicense,required this.email, this.phones, this.addresses, this.autoListOfShop});
	Map<String, dynamic> toJson() => {"id":id,"name":name,"socialSecurityNumber":socialSecurityNumber,"driverLicense":driverLicense,"email":email,"phones":phones,"addresses":addresses,"autoListOfShop":autoListOfShop};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"name":name,"socialSecurityNumber":socialSecurityNumber,"driverLicense":driverLicense,"email":email};
	User.fromJson(Map<String,dynamic> data): id=data["id"],name=data["name"],socialSecurityNumber=data["socialSecurityNumber"],driverLicense=data["driverLicense"],email=data["email"],phones=data["phones"],addresses=data["addresses"],autoListOfShop=data["autoListOfShop"];

}
