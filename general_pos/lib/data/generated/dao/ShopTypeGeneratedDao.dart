import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ShopTypeGeneratedDao implements IMVCDao<ShopType>{ 
		final Database db=getIt<Database>();

Future<int> insert(ShopType data){
	return this.db.insert("ShopType",data.toJson());
}

Future<int> insertWithoutDbAuto(ShopType data){return this.db.insert("ShopType",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("ShopType",where:"id=$id");
}

Future<ShopType?> read(int id)async{List t =await db.query("ShopType", where: "id=$id");
if (t.length == 1) {
return ShopType.fromJson(t[0]);
}return null;}
Future<List<ShopType>> readAll() async {List tmp = await db.query("ShopType");return tmp.map((value) => ShopType.fromJson(value)).toList();
}
Future<List<ShopType>> searchWith_type(String type) async {List tmp=await db.query('ShopType',where:"type=\"$type\"");return tmp.map((value)=>ShopType.fromJson(value)).toList();
}
Future<List<ShopType>> searchWith_type_like(String type) async {List tmp=await db.query('ShopType',where:"type like \"%$type%\"");return tmp.map((value)=>ShopType.fromJson(value)).toList();
}

}
