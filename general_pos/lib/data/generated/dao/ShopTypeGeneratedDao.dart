import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ShopTypeGeneratedDao implements IMVCDao<ShopType>{ 
		final Database db=getIt<Database>();

void insert(ShopType data){
	this.db.insert("ShopType",data.toJson());
}

void insertWithoutDbAuto(ShopType data){this.db.insert("ShopType",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("ShopType",where:"id=$id");
}

Future<ShopType?> read(int id)async{List t =await db.query("ShopType", where: "id=$id");
if (t.length == 1) {
return ShopType.fromJson(t[0]);
}return null;}
}
