import 'package:sqflite/sqflite.dart';
import '../all.dart';

class ProductPropertyNameDao extends ProductPropertyNameGeneratedDao {
  Future<List<ProductPropertyName>> readAllWithSearch(
      {String search = ''}) async {
    List<ProductPropertyName> output = (await this
            .db
            .query("ProductPropertyName", where: "name like ('%$search%')"))
        .map((x) {
      return ProductPropertyName.fromJson(x);
    }).toList();
    return output;
  }

  Future<List<ProductPropertyName>> searchWithName(String name) async {
    List tmp = await db.query("ProductPropertyName", where: "name='$name'");
    return tmp.map((value) => ProductPropertyName.fromJson(value)).toList();
  }

  Future<List<ProductPropertyName>> readExclude(
      List<ProductPropertyName> excludeList) async {
    var idList = excludeList.map((a) => a.id).toList();
    List tmp = await db.query("ProductPropertyName",
        where: "id not in (${idList.join(',')})");
    return tmp.map((a) => ProductPropertyName.fromJson(a)).toList();
  }
}
