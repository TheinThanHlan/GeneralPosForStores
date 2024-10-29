import 'package:sqflite/sqflite.dart';
import '../all.dart';

class ProductCategoryDao extends ProductCategoryGeneratedDao {
  Future<List<ProductCategory>> readAllWithSearch({String search = ''}) async {
    String sql =
        """select cat1.id as id1,cat1.name as name1,cat2.id as id2,cat2.name as name2
                    from ProductCategory As cat1 Left JOIN ProductCategory As cat2
                    on cat2.id=cat1.parentProductCategory where cat1.name like('%$search%')
                """;
    List<ProductCategory> output = [];
    List t = await db.rawQuery(sql);
    output = t.map((a) {
      ProductCategory tmp = ProductCategory(id: a['id1'], name: a['name1']);
      if (a['id2'] != null) {
        tmp.parentProductCategory =
            ProductCategory(id: a['id2'], name: a['name2']);
      }
      return tmp;
    }).toList();
    return output;
  }

  Future<List<ProductCategory>> searchWithName(String name) async {
    List tmp = await db.query("ProductCategory", where: "name='$name'");
    return tmp.map((value) => ProductCategory.fromJson(value)).toList();
  }

  void insertWithParentCategory(ProductCategory data) {
    //if (data.parentProductCategory != null) {
    //  this.db.execute(
    //      "insert into ProductCategory(name,parentProductCategory) values('${data.name}',${data.parentProductCategory?.id})");
    //} else {}
    this.insertWithoutDbAuto(data);
  }

  Future<List<ProductCategory>> readExclude(
      List<ProductCategory> excludeCategoryList) async {
    var idList = excludeCategoryList.map((a) => a.id).toList();
    List tmp = await db.query("ProductCategory",
        where: "id not in (${idList.join(',')})");
    return tmp.map((a) => ProductCategory.fromJson(a)).toList();
  }
}
