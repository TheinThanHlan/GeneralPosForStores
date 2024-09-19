import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductCategoryTypeGeneratedDao implements IMVCDao<ProductCategoryType>{ 
		final Database db=getIt<Database>();

void insert(ProductCategoryType data){
	this.db.insert("ProductCategoryType",data.toJson());
}

void insertWithoutDbAuto(ProductCategoryType data){this.db.insert("ProductCategoryType",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("ProductCategoryType",where:"id=$id");
}

Future<ProductCategoryType?> read(int id)async{List t =await db.query("ProductCategoryType", where: "id=$id");
if (t.length == 1) {
return ProductCategoryType.fromJson(t[0]);
}return null;}
}
