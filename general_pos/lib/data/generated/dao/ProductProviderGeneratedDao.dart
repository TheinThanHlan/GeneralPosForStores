import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductProviderGeneratedDao implements IMVCDao<ProductProvider>{ 
		final Database db=getIt<Database>();

void insert(ProductProvider data){
	this.db.insert("ProductProvider",data.toJson());
}

void insertWithoutDbAuto(ProductProvider data){this.db.insert("ProductProvider",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("ProductProvider",where:"id=$id");
}

Future<ProductProvider?> read(int id)async{List t =await db.query("ProductProvider", where: "id=$id");
if (t.length == 1) {
return ProductProvider.fromJson(t[0]);
}return null;}
}
