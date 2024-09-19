import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ShopGeneratedDao implements IMVCDao<Shop>{ 
		final Database db=getIt<Database>();

void insert(Shop data){
	this.db.insert("Shop",data.toJson());
}

void insertWithoutDbAuto(Shop data){this.db.insert("Shop",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("Shop",where:"id=$id");
}

Future<Shop?> read(int id)async{List t =await db.query("Shop", where: "id=$id");
if (t.length == 1) {
return Shop.fromJson(t[0]);
}return null;}
}
