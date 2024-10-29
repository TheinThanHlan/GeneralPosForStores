import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class VoucherGeneratedDao implements IMVCDao<Voucher>{ 
		final Database db=getIt<Database>();

Future<int> insert(Voucher data){
	return this.db.insert("Voucher",data.toJson());
}

Future<int> insertWithoutDbAuto(Voucher data){return this.db.insert("Voucher",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("Voucher",where:"id=$id");
}

Future<Voucher?> read(int id)async{List t =await db.query("Voucher", where: "id=$id");
if (t.length == 1) {
return Voucher.fromJson(t[0]);
}return null;}
Future<List<Voucher>> readAll() async {List tmp = await db.query("Voucher");return tmp.map((value) => Voucher.fromJson(value)).toList();
}
Future<List<Voucher>> searchWith_name(String name) async {List tmp=await db.query('Voucher',where:"name=\"$name\"");return tmp.map((value)=>Voucher.fromJson(value)).toList();
}
Future<List<Voucher>> searchWith_totalPrice(double totalPrice) async {List tmp=await db.query('Voucher',where:"totalPrice=$totalPrice");return tmp.map((value)=>Voucher.fromJson(value)).toList();
}
Future<List<Voucher>> searchWith_discount(double discount) async {List tmp=await db.query('Voucher',where:"discount=$discount");return tmp.map((value)=>Voucher.fromJson(value)).toList();
}
Future<List<Voucher>> searchWith_openedTime(DateTime openedTime) async {List tmp=await db.query('Voucher',where:"openedTime=$openedTime");return tmp.map((value)=>Voucher.fromJson(value)).toList();
}
Future<List<Voucher>> searchWith_closedTime(DateTime closedTime) async {List tmp=await db.query('Voucher',where:"closedTime=$closedTime");return tmp.map((value)=>Voucher.fromJson(value)).toList();
}

}
