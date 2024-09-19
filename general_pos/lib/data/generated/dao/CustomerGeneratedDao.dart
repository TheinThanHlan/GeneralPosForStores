import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class CustomerGeneratedDao implements IMVCDao<Customer>{ 
		final Database db=getIt<Database>();

void insert(Customer data){
	this.db.insert("Customer",data.toJson());
}

void insertWithoutDbAuto(Customer data){this.db.insert("Customer",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("Customer",where:"id=$id");
}

Future<Customer?> read(int id)async{List t =await db.query("Customer", where: "id=$id");
if (t.length == 1) {
return Customer.fromJson(t[0]);
}return null;}
}
