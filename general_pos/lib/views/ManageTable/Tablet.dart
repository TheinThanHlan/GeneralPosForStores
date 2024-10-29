import 'package:flutter/material.dart';
import 'package:general_pos/data/dao/ProductCategoryDao.dart';
import 'package:general_pos/views/Components/OCDialog/OCDialogComponent.dart';
import 'package:general_pos/views/Components/OCDialog/OCDialogModel.dart';
import '../../mvc_template/all.dart';
import '../../data/all.dart';
import 'package:flutter/material.dart';
import '../../mvc_template/all.dart';
import './ManageTableController.dart';

class Tablet extends StatefulWidget {
  late final ManageTableController controller;
  Tablet({required this.controller});

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Tablet();
  }
}

class _Tablet extends State<Tablet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 144,
                child: TextFormField(
                  controller: widget.controller.searchController,
                  //get the keyboard events
                  onChanged: (x) {
                    setState(() {});
                    if (widget.controller.searchController.text != "") {
                      widget.controller.ERROR_MESSAGE.value = "result";
                    } else {
                      widget.controller.ERROR_MESSAGE.value = "";
                    }
                  },
                  decoration: InputDecoration(
                    label: Text("Search/Add"),
                    //textinput clear text
                    suffixIcon: InkWell(
                      child: Icon(Icons.clear),
                      onTap: () {
                        widget.controller.searchController.clear();
                        widget.controller.ERROR_MESSAGE.value = "";
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  child: OutlinedButton(
                    onPressed: () {
                      if (widget.controller.searchController.text.isNotEmpty) {
                        var tmp = ServingTable(
                            name: widget.controller.searchController.text);
                        getIt<ServingTableDao>().insertWithoutDbAuto(tmp);
                        setState(() {});
                      } else {
                        widget.controller.ERROR_MESSAGE.value =
                            "Write table name in search box first";
                      }
                    },
                    child: Text("Add Table"),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            alignment: Alignment.centerLeft,
            child: ValueListenableBuilder(
              valueListenable: widget.controller.ERROR_MESSAGE,
              builder: (context, value, child) {
                return Text(value,
                    style: getIt<GlobalConfig>().warningTextStyle);
              },
            ),
          ),
        ),
        Expanded(
          flex: 100 - 13 - 5,
          child: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: getIt<ServingTableDao>().searchWith_name_like(
                    widget.controller.searchController.text),
                builder: (context, dataSnapshot) {
                  if (dataSnapshot.data != null) {
                    return DataTable(
                      columns: [
                        DataColumn(label: Text("No.")),
                        DataColumn(label: Text("Table Name")),
                        //DataColumn(label: Text("Parent")),
                        DataColumn(label: Text(""))
                      ],
                      rows: [
                        for (int a = 0; a < dataSnapshot.data!.length; a++)
                          DataRow(cells: [
                            DataCell(Text((a + 1).toString())),
                            DataCell(Text(dataSnapshot.data![a].name)),
                            // DataCell(Text(dataSnapshot
                            //         .data![a].parentProductCategory?.name ??
                            //     "")),
                            DataCell(IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                getIt<ServingTableDao>()
                                    .delete(dataSnapshot.data![a].id!)
                                    .then((x) {
                                  setState(() {});
                                });
                              },
                            ))
                          ])
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
