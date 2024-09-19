import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductPriceGeneratedDao implements IMVCDao<ProductPrice>{ 
		final Database db=getIt<Database>();

void insert(ProductPrice data){
	this.db.insert("ProductPrice",data.toJson());
}

void insertWithoutDbAuto(ProductPrice data){this.db.insert("ProductPrice",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("ProductPrice",where:"id=$id");
}

Future<ProductPrice?> read(int id)async{List t =await db.query("ProductPrice", where: "id=$id");
if (t.length == 1) {
return ProductPrice.fromJson(t[0]);
}return null;}
}
