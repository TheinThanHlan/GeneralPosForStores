import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class OrderGeneratedDao implements IMVCDao<Order>{ 
		final Database db=getIt<Database>();

void insert(Order data){
	this.db.insert("Order",data.toJson());
}

void insertWithoutDbAuto(Order data){this.db.insert("Order",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("Order",where:"id=$id");
}

Future<Order?> read(int id)async{List t =await db.query("Order", where: "id=$id");
if (t.length == 1) {
return Order.fromJson(t[0]);
}return null;}
}
