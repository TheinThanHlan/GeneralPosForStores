import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class AddressGeneratedDao implements IMVCDao<Address>{ 
		final Database db=getIt<Database>();

void insert(Address data){
	this.db.insert("Address",data.toJson());
}

void insertWithoutDbAuto(Address data){this.db.insert("Address",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("Address",where:"id=$id");
}

Future<Address?> read(int id)async{List t =await db.query("Address", where: "id=$id");
if (t.length == 1) {
return Address.fromJson(t[0]);
}return null;}
}
