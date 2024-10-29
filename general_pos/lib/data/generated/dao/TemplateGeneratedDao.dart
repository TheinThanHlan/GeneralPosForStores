import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class TemplateGeneratedDao implements IMVCDao<Template>{ 
		final Database db=getIt<Database>();

Future<int> insert(Template data){
	return this.db.insert("Template",data.toJson());
}

Future<int> insertWithoutDbAuto(Template data){return this.db.insert("Template",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("Template",where:"id=$id");
}

Future<Template?> read(int id)async{List t =await db.query("Template", where: "id=$id");
if (t.length == 1) {
return Template.fromJson(t[0]);
}return null;}
Future<List<Template>> readAll() async {List tmp = await db.query("Template");return tmp.map((value) => Template.fromJson(value)).toList();
}
Future<List<Template>> searchWith_createdDateTime(DateTime createdDateTime) async {List tmp=await db.query('Template',where:"createdDateTime=$createdDateTime");return tmp.map((value)=>Template.fromJson(value)).toList();
}

}
