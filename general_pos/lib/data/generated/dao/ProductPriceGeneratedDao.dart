import 'package:sqflite/sqflite.dart';
import '../../all.dart';
abstract class ProductPriceGeneratedDao implements IMVCDao<ProductPrice>{ 
		final Database db=getIt<Database>();

Future<int> insert(ProductPrice data){
	return this.db.insert("ProductPrice",data.toJson());
}

Future<int> insertWithoutDbAuto(ProductPrice data){return this.db.insert("ProductPrice",data.toJsonWithoutDbAuto());
}

Future<void> delete(int id)async{

await this.db.delete("ProductPrice",where:"id=$id");
}

Future<ProductPrice?> read(int id)async{List t =await db.query("ProductPrice", where: "id=$id");
if (t.length == 1) {
return ProductPrice.fromJson(t[0]);
}return null;}
Future<List<ProductPrice>> readAll() async {List tmp = await db.query("ProductPrice");return tmp.map((value) => ProductPrice.fromJson(value)).toList();
}
Future<List<ProductPrice>> searchWith_createdDateTime(DateTime createdDateTime) async {List tmp=await db.query('ProductPrice',where:"createdDateTime=$createdDateTime");return tmp.map((value)=>ProductPrice.fromJson(value)).toList();
}
Future<List<ProductPrice>> searchWith_price(int price) async {List tmp=await db.query('ProductPrice',where:"price=$price");return tmp.map((value)=>ProductPrice.fromJson(value)).toList();
}

}
