import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ColorGeneratedDao implements IMVCDao<Color>{ 
		final Database db=getIt<Database>();

Future<int> insert(Color data){
	return this.db.insert("Color",data.toJson());
}

Future<int> insertWithoutDbAuto(Color data){return this.db.insert("Color",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("Color",where:"id=$id");
}

Future<Color?> read(int id)async{List t =await db.query("Color", where: "id=$id");
if (t.length == 1) {
return Color.fromJson(t[0]);
}return null;}
Future<List<Color>> readAll() async {List tmp = await db.query("Color");return tmp.map((value) => Color.fromJson(value)).toList();
}
Future<List<Color>> searchWith_name(String name) async {List tmp=await db.query('Color',where:"name=\"$name\"");return tmp.map((value)=>Color.fromJson(value)).toList();
}
Future<List<Color>> searchWith_code(String code) async {List tmp=await db.query('Color',where:"code=\"$code\"");return tmp.map((value)=>Color.fromJson(value)).toList();
}
Future<List<Color>> searchWith_name_like(String name) async {List tmp=await db.query('Color',where:"name like \"%$name%\"");return tmp.map((value)=>Color.fromJson(value)).toList();
}
Future<List<Color>> searchWith_code_like(String code) async {List tmp=await db.query('Color',where:"code like \"%$code%\"");return tmp.map((value)=>Color.fromJson(value)).toList();
}

}
