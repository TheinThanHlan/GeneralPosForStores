import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class DeliveryGeneratedDao implements IMVCDao<Delivery>{ 
		final Database db=getIt<Database>();

void insert(Delivery data){
	this.db.insert("Delivery",data.toJson());
}

void insertWithoutDbAuto(Delivery data){this.db.insert("Delivery",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("Delivery",where:"id=$id");
}

Future<Delivery?> read(int id)async{List t =await db.query("Delivery", where: "id=$id");
if (t.length == 1) {
return Delivery.fromJson(t[0]);
}return null;}
}
