import '../../all.dart';
class Employee implements IMVCModel{ 
	int? id=0;
	late User user;
	List<Salary>? ListOfSalary_mappedBy_employee;
	Employee({ this.id,required this.user, this.ListOfSalary_mappedBy_employee});
	Map<String, dynamic> toJson() => {"id":id,"user":user,"ListOfSalary_mappedBy_employee":ListOfSalary_mappedBy_employee};
	Map<String, dynamic> toJsonWithoutDbAuto() => {};
	Employee.fromJson(Map<String,dynamic> data): id=data["id"],user=data["user"],ListOfSalary_mappedBy_employee=data["ListOfSalary_mappedBy_employee"];

	Employee clone(){return Employee.fromJson(this.toJson());}
}
