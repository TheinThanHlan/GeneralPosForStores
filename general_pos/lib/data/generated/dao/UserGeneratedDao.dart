import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class UserGeneratedDao implements IMVCDao<User>{ 
		final Database db=getIt<Database>();

void insert(User data){
	this.db.insert("User",data.toJson());
}

void insertWithoutDbAuto(User data){this.db.insert("User",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("User",where:"id=$id");
}

Future<User?> read(int id)async{List t =await db.query("User", where: "id=$id");
if (t.length == 1) {
return User.fromJson(t[0]);
}return null;}
}
