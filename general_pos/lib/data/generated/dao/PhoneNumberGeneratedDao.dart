import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class PhoneNumberGeneratedDao implements IMVCDao<PhoneNumber>{ 
		final Database db=getIt<Database>();

Future<int> insert(PhoneNumber data){
	return this.db.insert("PhoneNumber",data.toJson());
}

Future<int> insertWithoutDbAuto(PhoneNumber data){return this.db.insert("PhoneNumber",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("PhoneNumber",where:"id=$id");
}

Future<PhoneNumber?> read(int id)async{List t =await db.query("PhoneNumber", where: "id=$id");
if (t.length == 1) {
return PhoneNumber.fromJson(t[0]);
}return null;}
Future<List<PhoneNumber>> readAll() async {List tmp = await db.query("PhoneNumber");return tmp.map((value) => PhoneNumber.fromJson(value)).toList();
}
Future<List<PhoneNumber>> searchWith_number(String number) async {List tmp=await db.query('PhoneNumber',where:"number=\"$number\"");return tmp.map((value)=>PhoneNumber.fromJson(value)).toList();
}
Future<List<PhoneNumber>> searchWith_number_like(String number) async {List tmp=await db.query('PhoneNumber',where:"number like \"%$number%\"");return tmp.map((value)=>PhoneNumber.fromJson(value)).toList();
}

}
