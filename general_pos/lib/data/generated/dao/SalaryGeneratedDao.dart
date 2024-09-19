import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class SalaryGeneratedDao implements IMVCDao<Salary>{ 
		final Database db=getIt<Database>();

void insert(Salary data){
	this.db.insert("Salary",data.toJson());
}

void insertWithoutDbAuto(Salary data){this.db.insert("Salary",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("Salary",where:"id=$id");
}

Future<Salary?> read(int id)async{List t =await db.query("Salary", where: "id=$id");
if (t.length == 1) {
return Salary.fromJson(t[0]);
}return null;}
}
