import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class DeliveryMethodGeneratedDao implements IMVCDao<DeliveryMethod>{ 
		final Database db=getIt<Database>();

Future<int> insert(DeliveryMethod data){
	return this.db.insert("DeliveryMethod",data.toJson());
}

Future<int> insertWithoutDbAuto(DeliveryMethod data){return this.db.insert("DeliveryMethod",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("DeliveryMethod",where:"id=$id");
}

Future<DeliveryMethod?> read(int id)async{List t =await db.query("DeliveryMethod", where: "id=$id");
if (t.length == 1) {
return DeliveryMethod.fromJson(t[0]);
}return null;}
Future<List<DeliveryMethod>> readAll() async {List tmp = await db.query("DeliveryMethod");return tmp.map((value) => DeliveryMethod.fromJson(value)).toList();
}
Future<List<DeliveryMethod>> searchWith_name(double name) async {List tmp=await db.query('DeliveryMethod',where:"name=$name");return tmp.map((value)=>DeliveryMethod.fromJson(value)).toList();
}

}
