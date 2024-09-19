import '../../all.dart';
class Employee implements IMVCModel{ 
	int? id=0;
	late User user;
	List<Salary>? autoListOfSalary;
	Employee({ this.id,required this.user, this.autoListOfSalary});
	Map<String, dynamic> toJson() => {"id":id,"user":user,"autoListOfSalary":autoListOfSalary};
	Map<String, dynamic> toJsonWithoutDbAuto() => {};
	Employee.fromJson(Map<String,dynamic> data): id=data["id"],user=data["user"],autoListOfSalary=data["autoListOfSalary"];

}
