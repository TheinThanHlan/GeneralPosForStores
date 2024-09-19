import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductTemplateGeneratedDao implements IMVCDao<ProductTemplate>{ 
		final Database db=getIt<Database>();

void insert(ProductTemplate data){
	this.db.insert("ProductTemplate",data.toJson());
}

void insertWithoutDbAuto(ProductTemplate data){this.db.insert("ProductTemplate",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("ProductTemplate",where:"id=$id");
}

Future<ProductTemplate?> read(int id)async{List t =await db.query("ProductTemplate", where: "id=$id");
if (t.length == 1) {
return ProductTemplate.fromJson(t[0]);
}return null;}
}
