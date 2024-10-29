import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class VoucherStatusGeneratedDao implements IMVCDao<VoucherStatus>{ 
		final Database db=getIt<Database>();

Future<int> insert(VoucherStatus data){
	return this.db.insert("VoucherStatus",data.toJson());
}

Future<int> insertWithoutDbAuto(VoucherStatus data){return this.db.insert("VoucherStatus",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("VoucherStatus",where:"id=$id");
}

Future<VoucherStatus?> read(int id)async{List t =await db.query("VoucherStatus", where: "id=$id");
if (t.length == 1) {
return VoucherStatus.fromJson(t[0]);
}return null;}
Future<List<VoucherStatus>> readAll() async {List tmp = await db.query("VoucherStatus");return tmp.map((value) => VoucherStatus.fromJson(value)).toList();
}
Future<List<VoucherStatus>> searchWith_name(String name) async {List tmp=await db.query('VoucherStatus',where:"name=\"$name\"");return tmp.map((value)=>VoucherStatus.fromJson(value)).toList();
}
Future<List<VoucherStatus>> searchWith_name_like(String name) async {List tmp=await db.query('VoucherStatus',where:"name like \"%$name%\"");return tmp.map((value)=>VoucherStatus.fromJson(value)).toList();
}

}
