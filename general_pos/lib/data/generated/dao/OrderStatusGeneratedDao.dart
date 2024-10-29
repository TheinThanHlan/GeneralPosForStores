import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class OrderStatusGeneratedDao implements IMVCDao<OrderStatus>{ 
		final Database db=getIt<Database>();

Future<int> insert(OrderStatus data){
	return this.db.insert("OrderStatus",data.toJson());
}

Future<int> insertWithoutDbAuto(OrderStatus data){return this.db.insert("OrderStatus",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("OrderStatus",where:"id=$id");
}

Future<OrderStatus?> read(int id)async{List t =await db.query("OrderStatus", where: "id=$id");
if (t.length == 1) {
return OrderStatus.fromJson(t[0]);
}return null;}
Future<List<OrderStatus>> readAll() async {List tmp = await db.query("OrderStatus");return tmp.map((value) => OrderStatus.fromJson(value)).toList();
}
Future<List<OrderStatus>> searchWith_name(String name) async {List tmp=await db.query('OrderStatus',where:"name=\"$name\"");return tmp.map((value)=>OrderStatus.fromJson(value)).toList();
}
Future<List<OrderStatus>> searchWith_name_like(String name) async {List tmp=await db.query('OrderStatus',where:"name like \"%$name%\"");return tmp.map((value)=>OrderStatus.fromJson(value)).toList();
}

}
