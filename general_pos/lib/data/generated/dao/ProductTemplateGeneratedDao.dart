import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductTemplateGeneratedDao implements IMVCDao<ProductTemplate>{ 
		final Database db=getIt<Database>();

Future<int> insert(ProductTemplate data){
	return this.db.insert("ProductTemplate",data.toJson());
}

Future<int> insertWithoutDbAuto(ProductTemplate data){return this.db.insert("ProductTemplate",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("ProductTemplate",where:"id=$id");
}

Future<ProductTemplate?> read(int id)async{List t =await db.query("ProductTemplate", where: "id=$id");
if (t.length == 1) {
return ProductTemplate.fromJson(t[0]);
}return null;}
Future<List<ProductTemplate>> readAll() async {List tmp = await db.query("ProductTemplate");return tmp.map((value) => ProductTemplate.fromJson(value)).toList();
}
Future<List<ProductTemplate>> searchWith_name(String name) async {List tmp=await db.query('ProductTemplate',where:"name=\"$name\"");return tmp.map((value)=>ProductTemplate.fromJson(value)).toList();
}
Future<List<ProductTemplate>> searchWith_description(String description) async {List tmp=await db.query('ProductTemplate',where:"description=\"$description\"");return tmp.map((value)=>ProductTemplate.fromJson(value)).toList();
}
Future<List<ProductTemplate>> searchWith_name_like(String name) async {List tmp=await db.query('ProductTemplate',where:"name like \"%$name%\"");return tmp.map((value)=>ProductTemplate.fromJson(value)).toList();
}

}
