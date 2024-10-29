import 'package:sqflite/sqflite.dart';
import '../all.dart';

class ProductPriceDao extends ProductPriceGeneratedDao {
  Future<int> addNewPrice(ProductPrice productPrice) async {
    int priceId = await db.insert("ProductPrice", {
      'price': productPrice.price,
      "Inventory_mappedBy_prices": productPrice.Inventory_mappedBy_prices!.id,
    });
    db.update("Inventory", {"currentPrice": priceId},
        where: "id=${productPrice.Inventory_mappedBy_prices!.id}");
    return priceId;
  }
}
