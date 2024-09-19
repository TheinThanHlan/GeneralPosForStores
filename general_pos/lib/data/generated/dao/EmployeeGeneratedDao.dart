import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class EmployeeGeneratedDao implements IMVCDao<Employee>{ 
		final Database db=getIt<Database>();

void insert(Employee data){
	this.db.insert("Employee",data.toJson());
}

void insertWithoutDbAuto(Employee data){this.db.insert("Employee",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("Employee",where:"id=$id");
}

Future<Employee?> read(int id)async{List t =await db.query("Employee", where: "id=$id");
if (t.length == 1) {
return Employee.fromJson(t[0]);
}return null;}
}
