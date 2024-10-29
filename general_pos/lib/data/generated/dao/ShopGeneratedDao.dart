import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ShopGeneratedDao implements IMVCDao<Shop>{ 
		final Database db=getIt<Database>();

Future<int> insert(Shop data){
	return this.db.insert("Shop",data.toJson());
}

Future<int> insertWithoutDbAuto(Shop data){return this.db.insert("Shop",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("Shop",where:"id=$id");
}

Future<Shop?> read(int id)async{List t =await db.query("Shop", where: "id=$id");
if (t.length == 1) {
return Shop.fromJson(t[0]);
}return null;}
Future<List<Shop>> readAll() async {List tmp = await db.query("Shop");return tmp.map((value) => Shop.fromJson(value)).toList();
}
Future<List<Shop>> searchWith_createdDateTime(DateTime createdDateTime) async {List tmp=await db.query('Shop',where:"createdDateTime=$createdDateTime");return tmp.map((value)=>Shop.fromJson(value)).toList();
}
Future<List<Shop>> searchWith_name(String name) async {List tmp=await db.query('Shop',where:"name=\"$name\"");return tmp.map((value)=>Shop.fromJson(value)).toList();
}
Future<List<Shop>> searchWith_name_like(String name) async {List tmp=await db.query('Shop',where:"name like \"%$name%\"");return tmp.map((value)=>Shop.fromJson(value)).toList();
}

}
