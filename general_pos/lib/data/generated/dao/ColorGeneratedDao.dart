import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ColorGeneratedDao implements IMVCDao<Color>{ 
		final Database db=getIt<Database>();

void insert(Color data){
	this.db.insert("Color",data.toJson());
}

void insertWithoutDbAuto(Color data){this.db.insert("Color",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("Color",where:"id=$id");
}

Future<Color?> read(int id)async{List t =await db.query("Color", where: "id=$id");
if (t.length == 1) {
return Color.fromJson(t[0]);
}return null;}
}
