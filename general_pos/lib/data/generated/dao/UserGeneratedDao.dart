import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class UserGeneratedDao implements IMVCDao<User>{ 
		final Database db=getIt<Database>();

Future<int> insert(User data){
	return this.db.insert("User",data.toJson());
}

Future<int> insertWithoutDbAuto(User data){return this.db.insert("User",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("User",where:"id=$id");
}

Future<User?> read(int id)async{List t =await db.query("User", where: "id=$id");
if (t.length == 1) {
return User.fromJson(t[0]);
}return null;}
Future<List<User>> readAll() async {List tmp = await db.query("User");return tmp.map((value) => User.fromJson(value)).toList();
}
Future<List<User>> searchWith_name(String name) async {List tmp=await db.query('User',where:"name=\"$name\"");return tmp.map((value)=>User.fromJson(value)).toList();
}
Future<List<User>> searchWith_socialSecurityNumber(String socialSecurityNumber) async {List tmp=await db.query('User',where:"socialSecurityNumber=\"$socialSecurityNumber\"");return tmp.map((value)=>User.fromJson(value)).toList();
}
Future<List<User>> searchWith_driverLicense(String driverLicense) async {List tmp=await db.query('User',where:"driverLicense=\"$driverLicense\"");return tmp.map((value)=>User.fromJson(value)).toList();
}
Future<List<User>> searchWith_email(String email) async {List tmp=await db.query('User',where:"email=\"$email\"");return tmp.map((value)=>User.fromJson(value)).toList();
}
Future<List<User>> searchWith_name_like(String name) async {List tmp=await db.query('User',where:"name like \"%$name%\"");return tmp.map((value)=>User.fromJson(value)).toList();
}
Future<List<User>> searchWith_email_like(String email) async {List tmp=await db.query('User',where:"email like \"%$email%\"");return tmp.map((value)=>User.fromJson(value)).toList();
}

}
