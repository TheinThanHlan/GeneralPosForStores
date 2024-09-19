import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class DeliveryMethodGeneratedDao implements IMVCDao<DeliveryMethod>{ 
		final Database db=getIt<Database>();

void insert(DeliveryMethod data){
	this.db.insert("DeliveryMethod",data.toJson());
}

void insertWithoutDbAuto(DeliveryMethod data){this.db.insert("DeliveryMethod",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("DeliveryMethod",where:"id=$id");
}

Future<DeliveryMethod?> read(int id)async{List t =await db.query("DeliveryMethod", where: "id=$id");
if (t.length == 1) {
return DeliveryMethod.fromJson(t[0]);
}return null;}
}
