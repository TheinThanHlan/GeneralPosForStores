import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductProviderGeneratedDao implements IMVCDao<ProductProvider>{ 
		final Database db=getIt<Database>();

Future<int> insert(ProductProvider data){
	return this.db.insert("ProductProvider",data.toJson());
}

Future<int> insertWithoutDbAuto(ProductProvider data){return this.db.insert("ProductProvider",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("ProductProvider",where:"id=$id");
}

Future<ProductProvider?> read(int id)async{List t =await db.query("ProductProvider", where: "id=$id");
if (t.length == 1) {
return ProductProvider.fromJson(t[0]);
}return null;}
Future<List<ProductProvider>> readAll() async {List tmp = await db.query("ProductProvider");return tmp.map((value) => ProductProvider.fromJson(value)).toList();
}
Future<List<ProductProvider>> searchWith_ratings(double ratings) async {List tmp=await db.query('ProductProvider',where:"ratings=$ratings");return tmp.map((value)=>ProductProvider.fromJson(value)).toList();
}

}
