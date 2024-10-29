import '../../all.dart';
class Salary implements IMVCModel{ 
	int? id=0;
	int salary=0;
	DateTime? dateTime;
	late Employee employee;
	Salary({ this.id,required this.salary, this.dateTime,required this.employee});
	Map<String, dynamic> toJson() => {"id":id,"salary":salary,"dateTime":dateTime,"employee":employee};
	Map<String, dynamic> toJsonWithoutDbAuto() => {"salary":salary};
	Salary.fromJson(Map<String,dynamic> data): id=data["id"],salary=data["salary"],dateTime=DateTime.parse(data["dateTime"]),employee=data["employee"];

	Salary clone(){return Salary.fromJson(this.toJson());}
}
