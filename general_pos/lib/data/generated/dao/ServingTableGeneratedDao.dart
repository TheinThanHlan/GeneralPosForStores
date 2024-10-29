import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ServingTableGeneratedDao implements IMVCDao<ServingTable>{ 
		final Database db=getIt<Database>();

Future<int> insert(ServingTable data){
	return this.db.insert("ServingTable",data.toJson());
}

Future<int> insertWithoutDbAuto(ServingTable data){return this.db.insert("ServingTable",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("ServingTable",where:"id=$id");
}

Future<ServingTable?> read(int id)async{List t =await db.query("ServingTable", where: "id=$id");
if (t.length == 1) {
return ServingTable.fromJson(t[0]);
}return null;}
Future<List<ServingTable>> readAll() async {List tmp = await db.query("ServingTable");return tmp.map((value) => ServingTable.fromJson(value)).toList();
}
Future<List<ServingTable>> searchWith_name(String name) async {List tmp=await db.query('ServingTable',where:"name=\"$name\"");return tmp.map((value)=>ServingTable.fromJson(value)).toList();
}
Future<List<ServingTable>> searchWith_name_like(String name) async {List tmp=await db.query('ServingTable',where:"name like \"%$name%\"");return tmp.map((value)=>ServingTable.fromJson(value)).toList();
}

}
