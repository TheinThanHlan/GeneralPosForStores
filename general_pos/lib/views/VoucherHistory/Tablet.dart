import 'package:flutter/material.dart';
import '../../mvc_template/all.dart';
import './VoucherHistoryController.dart';
import '../../data/all.dart';

class Tablet extends StatefulWidget {
  late final VoucherHistoryController controller;
  Tablet({required this.controller});

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Tablet();
  }
}

class _Tablet extends State<Tablet> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Vouchers",
            style: getIt<GlobalConfig>().titleTextStyle,
          ),
          height: getIt<GlobalConfig>().top_bar,
        ),
        //show list of vouchers
        FutureBuilder(
          future: getIt<VoucherDao>().readAll(),
          builder: (context, snapshot) {
            return Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  width: double.maxFinite,
                  child: DataTable(
                    border: getIt<GlobalConfig>().table_border,
                    columns: [
                      DataColumn(label: Text("No."), numeric: true),
                      DataColumn(label: Text("Table")),
                      DataColumn(label: Text("Date Time")),
                      DataColumn(label: Text("Total")),
                      DataColumn(label: Text("Discount")),
                    ],
                    rows: [
                      if (snapshot.data != null)
                        for (int a = 0; a < snapshot.data!.length; a++)
                          DataRow(
                            cells: [
                              DataCell(Text((a + 1).toString())),
                              DataCell(Text(snapshot.data![a].table!.name)),
                              DataCell(Text(
                                  snapshot.data![a].openedTime!.toString())),
                              DataCell(Text(
                                  snapshot.data![a].totalPrice.toString())),
                              DataCell(
                                  Text(snapshot.data![a].discount.toString())),
                            ],
                          )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  //show vouchers
  Widget showVoucherDetail() {
    return Container(color: Colors.green);
  }

  //vouchers list with dates
  Widget showVoucherList() {
    return Container(color: Colors.red);
  }
}
