import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class InventoryGeneratedDao implements IMVCDao<Inventory>{ 
		final Database db=getIt<Database>();

void insert(Inventory data){
	this.db.insert("Inventory",data.toJson());
}

void insertWithoutDbAuto(Inventory data){this.db.insert("Inventory",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("Inventory",where:"id=$id");
}

Future<Inventory?> read(int id)async{List t =await db.query("Inventory", where: "id=$id");
if (t.length == 1) {
return Inventory.fromJson(t[0]);
}return null;}
}
