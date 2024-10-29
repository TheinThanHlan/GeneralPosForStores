import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class EmployeeGeneratedDao implements IMVCDao<Employee>{ 
		final Database db=getIt<Database>();

Future<int> insert(Employee data){
	return this.db.insert("Employee",data.toJson());
}

Future<int> insertWithoutDbAuto(Employee data){return this.db.insert("Employee",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("Employee",where:"id=$id");
}

Future<Employee?> read(int id)async{List t =await db.query("Employee", where: "id=$id");
if (t.length == 1) {
return Employee.fromJson(t[0]);
}return null;}
Future<List<Employee>> readAll() async {List tmp = await db.query("Employee");return tmp.map((value) => Employee.fromJson(value)).toList();
}

}
