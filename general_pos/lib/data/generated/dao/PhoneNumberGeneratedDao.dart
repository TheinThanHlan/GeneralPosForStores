import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class PhoneNumberGeneratedDao implements IMVCDao<PhoneNumber>{ 
		final Database db=getIt<Database>();

void insert(PhoneNumber data){
	this.db.insert("PhoneNumber",data.toJson());
}

void insertWithoutDbAuto(PhoneNumber data){this.db.insert("PhoneNumber",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("PhoneNumber",where:"id=$id");
}

Future<PhoneNumber?> read(int id)async{List t =await db.query("PhoneNumber", where: "id=$id");
if (t.length == 1) {
return PhoneNumber.fromJson(t[0]);
}return null;}
}
