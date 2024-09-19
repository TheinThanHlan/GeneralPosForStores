import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class TemplateGeneratedDao implements IMVCDao<Template>{ 
		final Database db=getIt<Database>();

void insert(Template data){
	this.db.insert("Template",data.toJson());
}

void insertWithoutDbAuto(Template data){this.db.insert("Template",data.toJsonWithoutDbAuto());
}

void delete(int id){

this.db.delete("Template",where:"id=$id");
}

Future<Template?> read(int id)async{List t =await db.query("Template", where: "id=$id");
if (t.length == 1) {
return Template.fromJson(t[0]);
}return null;}
}
