import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class OrderStatusGeneratedDao implements IMVCDao<OrderStatus>{ 
		final Database db=getIt<Database>();

void insert(OrderStatus data){
	this.db.insert("OrderStatus",data.toJson());
}

void insertWithoutDbAuto(OrderStatus data){this.db.insert("OrderStatus",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("OrderStatus",where:"id=$id");
}

Future<OrderStatus?> read(int id)async{List t =await db.query("OrderStatus", where: "id=$id");
if (t.length == 1) {
return OrderStatus.fromJson(t[0]);
}return null;}
}
