import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class AddressGeneratedDao implements IMVCDao<Address>{ 
		final Database db=getIt<Database>();

Future<int> insert(Address data){
	return this.db.insert("Address",data.toJson());
}

Future<int> insertWithoutDbAuto(Address data){return this.db.insert("Address",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("Address",where:"id=$id");
}

Future<Address?> read(int id)async{List t =await db.query("Address", where: "id=$id");
if (t.length == 1) {
return Address.fromJson(t[0]);
}return null;}
Future<List<Address>> readAll() async {List tmp = await db.query("Address");return tmp.map((value) => Address.fromJson(value)).toList();
}
Future<List<Address>> searchWith_address(String address) async {List tmp=await db.query('Address',where:"address=\"$address\"");return tmp.map((value)=>Address.fromJson(value)).toList();
}
Future<List<Address>> searchWith_latitude(double latitude) async {List tmp=await db.query('Address',where:"latitude=$latitude");return tmp.map((value)=>Address.fromJson(value)).toList();
}
Future<List<Address>> searchWith_longitude(double longitude) async {List tmp=await db.query('Address',where:"longitude=$longitude");return tmp.map((value)=>Address.fromJson(value)).toList();
}
Future<List<Address>> searchWith_address_like(String address) async {List tmp=await db.query('Address',where:"address like \"%$address%\"");return tmp.map((value)=>Address.fromJson(value)).toList();
}

}
