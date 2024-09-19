import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductCategoryGeneratedDao implements IMVCDao<ProductCategory>{ 
		final Database db=getIt<Database>();

void insert(ProductCategory data){
	this.db.insert("ProductCategory",data.toJson());
}

void insertWithoutDbAuto(ProductCategory data){this.db.insert("ProductCategory",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("ProductCategory",where:"id=$id");
}

Future<ProductCategory?> read(int id)async{List t =await db.query("ProductCategory", where: "id=$id");
if (t.length == 1) {
return ProductCategory.fromJson(t[0]);
}return null;}
}
