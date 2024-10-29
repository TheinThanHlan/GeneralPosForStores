import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class DeliveryGeneratedDao implements IMVCDao<Delivery>{ 
		final Database db=getIt<Database>();

Future<int> insert(Delivery data){
	return this.db.insert("Delivery",data.toJson());
}

Future<int> insertWithoutDbAuto(Delivery data){return this.db.insert("Delivery",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("Delivery",where:"id=$id");
}

Future<Delivery?> read(int id)async{List t =await db.query("Delivery", where: "id=$id");
if (t.length == 1) {
return Delivery.fromJson(t[0]);
}return null;}
Future<List<Delivery>> readAll() async {List tmp = await db.query("Delivery");return tmp.map((value) => Delivery.fromJson(value)).toList();
}
Future<List<Delivery>> searchWith_rating(double rating) async {List tmp=await db.query('Delivery',where:"rating=$rating");return tmp.map((value)=>Delivery.fromJson(value)).toList();
}

}
