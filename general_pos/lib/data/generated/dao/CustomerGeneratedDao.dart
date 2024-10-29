import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class CustomerGeneratedDao implements IMVCDao<Customer>{ 
		final Database db=getIt<Database>();

Future<int> insert(Customer data){
	return this.db.insert("Customer",data.toJson());
}

Future<int> insertWithoutDbAuto(Customer data){return this.db.insert("Customer",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("Customer",where:"id=$id");
}

Future<Customer?> read(int id)async{List t =await db.query("Customer", where: "id=$id");
if (t.length == 1) {
return Customer.fromJson(t[0]);
}return null;}
Future<List<Customer>> readAll() async {List tmp = await db.query("Customer");return tmp.map((value) => Customer.fromJson(value)).toList();
}

}
