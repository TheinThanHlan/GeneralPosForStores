import 'package:sqflite/sqflite.dart';
import '../all.dart';

class VoucherDao extends VoucherGeneratedDao {
  Future<int> createNewVoucher(Voucher data) {
    return db.insert(
        'Voucher', {'name': data.name, 'status': 1, 'table': data.table!.id});
  }

  Future<List<Voucher>> searchWith_table_name_like(String table_name) async {
    String sql =
        """Select v.name as vName,v.id as vId,v.totalPrice,v.discount,v.openedTime,vs.id as vsId,vs.name as vsName,st.id as stId,st.name as stName
           from Voucher as v
           INNER JOIN ServingTable AS st ON v.'table'=st.id
           INNER JOIN VoucherStatus as vs on v.status=vs.id
           where v.status!=3 and st.name like "%$table_name%" order by st.name;
     ;""";
    List tmp = await db.rawQuery(sql);
    //print(tmp);
    return tmp.map((a) {
      return Voucher(
        id: a['vId'],
        name: a['vName'],
        openedTime: DateTime.parse(a['openedTime']),
        totalPrice: a["totalPrice"],
        discount: a["discount"],
        status: VoucherStatus(name: a['vsName'], id: a['vsId']),
        table: ServingTable(name: a['stName'], id: a["stId"]),
      );
    }).toList();
  }

  Future<List<Voucher>> readAll() async {
    String sql =
        """Select v.name as vName,v.id as vId,v.totalPrice,v.discount,v.openedTime,vs.id as vsId,vs.name as vsName,st.id as stId,st.name as stName
           from Voucher as v
           INNER JOIN ServingTable AS st ON v.'table'=st.id
           INNER JOIN VoucherStatus as vs on v.status=vs.id
           where v.status==3 order by v.id DESC;
     ;""";
    List tmp = await db.rawQuery(sql);
    //print(tmp);
    return tmp.map((a) {
      return Voucher(
        id: a['vId'],
        name: a['vName'],
        openedTime: DateTime.parse(a['openedTime']),
        totalPrice: a["totalPrice"],
        discount: a["discount"],
        status: VoucherStatus(name: a['vsName'], id: a['vsId']),
        table: ServingTable(name: a['stName'], id: a["stId"]),
      );
    }).toList();
  }

  Future<int> readLastOpenVoucherNumberOfTable(ServingTable table) async {
    final tmp = await db.rawQuery(
        "select Max(Cast(v.'name' as int)) largestName from 'Voucher' v where v.'status'!=3 And v.'table'=${table.id};");
    return Sqflite.firstIntValue(tmp) ?? 0;
  }

  Future<int> closeVoucher(Voucher voucher) async {
    return db.update("'Voucher'", {'status': 3}, where: "id=${voucher.id}");
  }

  Future<int> getTotalPrice(Voucher voucher) async {
    String sql = """
    select
    SUM(o.qty*pp.price)  totalPrice
    from 'Order' o
    inner join 'Inventory' i on o.item=i.id
    inner join 'ProductPrice' pp on pp.id=i.currentPrice
    where o.voucher=${voucher.id}
    Group By o.voucher
    """;
    final tmp = await db.rawQuery(sql);
    int totalPrice =
        tmp.first['totalPrice'] != null ? tmp.first['totalPrice'] as int : 0;
    return totalPrice;
  }
}
