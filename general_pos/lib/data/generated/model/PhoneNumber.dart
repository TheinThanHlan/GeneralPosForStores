import '../../all.dart';
class PhoneNumber implements IMVCModel{ 
	int? id=0;
	late String number;
	User? autoUser;
	PhoneNumber({ this.id,required this.number, this.autoUser});
	Map<String, dynamic> toJson() => {"id":id,"number":number,"autoUser":autoUser};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"number":number};
	PhoneNumber.fromJson(Map<String,dynamic> data): id=data["id"],number=data["number"],autoUser=data["autoUser"];

}
