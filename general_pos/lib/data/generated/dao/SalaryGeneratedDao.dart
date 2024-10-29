import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class SalaryGeneratedDao implements IMVCDao<Salary>{ 
		final Database db=getIt<Database>();

Future<int> insert(Salary data){
	return this.db.insert("Salary",data.toJson());
}

Future<int> insertWithoutDbAuto(Salary data){return this.db.insert("Salary",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("Salary",where:"id=$id");
}

Future<Salary?> read(int id)async{List t =await db.query("Salary", where: "id=$id");
if (t.length == 1) {
return Salary.fromJson(t[0]);
}return null;}
Future<List<Salary>> readAll() async {List tmp = await db.query("Salary");return tmp.map((value) => Salary.fromJson(value)).toList();
}
Future<List<Salary>> searchWith_salary(int salary) async {List tmp=await db.query('Salary',where:"salary=$salary");return tmp.map((value)=>Salary.fromJson(value)).toList();
}
Future<List<Salary>> searchWith_dateTime(DateTime dateTime) async {List tmp=await db.query('Salary',where:"dateTime=$dateTime");return tmp.map((value)=>Salary.fromJson(value)).toList();
}

}
