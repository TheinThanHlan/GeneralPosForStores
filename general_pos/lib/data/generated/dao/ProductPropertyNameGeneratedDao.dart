import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductPropertyNameGeneratedDao implements IMVCDao<ProductPropertyName>{ 
		final Database db=getIt<Database>();

Future<int> insert(ProductPropertyName data){
	return this.db.insert("ProductPropertyName",data.toJson());
}

Future<int> insertWithoutDbAuto(ProductPropertyName data){return this.db.insert("ProductPropertyName",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("ProductPropertyName",where:"id=$id");
}

Future<ProductPropertyName?> read(int id)async{List t =await db.query("ProductPropertyName", where: "id=$id");
if (t.length == 1) {
return ProductPropertyName.fromJson(t[0]);
}return null;}
Future<List<ProductPropertyName>> readAll() async {List tmp = await db.query("ProductPropertyName");return tmp.map((value) => ProductPropertyName.fromJson(value)).toList();
}
Future<List<ProductPropertyName>> searchWith_name(String name) async {List tmp=await db.query('ProductPropertyName',where:"name=\"$name\"");return tmp.map((value)=>ProductPropertyName.fromJson(value)).toList();
}
Future<List<ProductPropertyName>> searchWith_name_like(String name) async {List tmp=await db.query('ProductPropertyName',where:"name like \"%$name%\"");return tmp.map((value)=>ProductPropertyName.fromJson(value)).toList();
}

}
