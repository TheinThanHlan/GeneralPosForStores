import '../../all.dart';
class PhoneNumber implements IMVCModel{ 
	int? id=0;
	late String number;
	User? User_mappedBy_phones;
	PhoneNumber({ this.id,required this.number, this.User_mappedBy_phones});
	Map<String, dynamic> toJson() => {"id":id,"number":number,"User_mappedBy_phones":User_mappedBy_phones};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"number":number};
	PhoneNumber.fromJson(Map<String,dynamic> data): id=data["id"],number=data["number"],User_mappedBy_phones=data["User_mappedBy_phones"];

	PhoneNumber clone(){return PhoneNumber.fromJson(this.toJson());}
}
