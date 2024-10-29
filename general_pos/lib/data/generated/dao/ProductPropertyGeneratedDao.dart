import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductPropertyGeneratedDao implements IMVCDao<ProductProperty>{ 
		final Database db=getIt<Database>();

Future<int> insert(ProductProperty data){
	return this.db.insert("ProductProperty",data.toJson());
}

Future<int> insertWithoutDbAuto(ProductProperty data){return this.db.insert("ProductProperty",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("ProductProperty",where:"id=$id");
}

Future<ProductProperty?> read(int id)async{List t =await db.query("ProductProperty", where: "id=$id");
if (t.length == 1) {
return ProductProperty.fromJson(t[0]);
}return null;}
Future<List<ProductProperty>> readAll() async {List tmp = await db.query("ProductProperty");return tmp.map((value) => ProductProperty.fromJson(value)).toList();
}
Future<List<ProductProperty>> searchWith_value(String value) async {List tmp=await db.query('ProductProperty',where:"value=\"$value\"");return tmp.map((value)=>ProductProperty.fromJson(value)).toList();
}
Future<List<ProductProperty>> searchWith_value_like(String value) async {List tmp=await db.query('ProductProperty',where:"value like \"%$value%\"");return tmp.map((value)=>ProductProperty.fromJson(value)).toList();
}

}
