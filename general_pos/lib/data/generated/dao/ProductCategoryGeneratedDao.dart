import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductCategoryGeneratedDao implements IMVCDao<ProductCategory>{ 
		final Database db=getIt<Database>();

Future<int> insert(ProductCategory data){
	return this.db.insert("ProductCategory",data.toJson());
}

Future<int> insertWithoutDbAuto(ProductCategory data){return this.db.insert("ProductCategory",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("ProductCategory",where:"id=$id");
}

Future<ProductCategory?> read(int id)async{List t =await db.query("ProductCategory", where: "id=$id");
if (t.length == 1) {
return ProductCategory.fromJson(t[0]);
}return null;}
Future<List<ProductCategory>> readAll() async {List tmp = await db.query("ProductCategory");return tmp.map((value) => ProductCategory.fromJson(value)).toList();
}
Future<List<ProductCategory>> searchWith_name(String name) async {List tmp=await db.query('ProductCategory',where:"name=\"$name\"");return tmp.map((value)=>ProductCategory.fromJson(value)).toList();
}
Future<List<ProductCategory>> searchWith_name_like(String name) async {List tmp=await db.query('ProductCategory',where:"name like \"%$name%\"");return tmp.map((value)=>ProductCategory.fromJson(value)).toList();
}

}
