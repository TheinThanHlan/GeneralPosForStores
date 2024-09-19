import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductSizeGeneratedDao implements IMVCDao<ProductSize>{ 
		final Database db=getIt<Database>();

void insert(ProductSize data){
	this.db.insert("ProductSize",data.toJson());
}

void insertWithoutDbAuto(ProductSize data){this.db.insert("ProductSize",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("ProductSize",where:"id=$id");
}

Future<ProductSize?> read(int id)async{List t =await db.query("ProductSize", where: "id=$id");
if (t.length == 1) {
return ProductSize.fromJson(t[0]);
}return null;}
}
