import 'package:flutter/material.dart';
import 'package:general_pos/data/dao/ProductCategoryDao.dart';
import 'package:general_pos/views/Components/OCDialog/OCDialogComponent.dart';
import 'package:general_pos/views/Components/OCDialog/OCDialogModel.dart';
import '../../mvc_template/all.dart';
import './ManageCategoryController.dart';

class Tablet extends StatefulWidget {
  late final ManageCategoryController controller;
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
                      widget.controller.ERROR_MESSAGE.value = "Searched Result";
                    } else {
                      widget.controller.ERROR_MESSAGE.value = "";
                    }
                  },
                  decoration: InputDecoration(
                    label: Text("Search/Add",
                        style: getIt<GlobalConfig>().textStyle),
                    //textinput clear text
                    suffixIcon: InkWell(
                      child: Icon(Icons.clear),
                      onTap: () {
                        widget.controller.ERROR_MESSAGE.value = "";
                        widget.controller.searchController.clear();
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
                      widget.controller.addCategory().then((x) {
                        setState(() {});
                      });
                    },
                    child: Text("Add Product Type"),
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
                future: widget.controller.getCategories(
                    searchName: widget.controller.searchController.text),
                builder: (context, dataSnapshot) {
                  if (dataSnapshot.data != null) {
                    return DataTable(
                      columns: [
                        DataColumn(label: Text("No.")),
                        DataColumn(label: Text("Product Type")),
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
                                getIt<ProductCategoryDao>()
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

  Future showAddDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          var oCDialogModel = OCDialogModel(
            error_message: widget.controller.addErrorMessage,
            title: "Parent အမျိုးအစား",
            ok: widget.controller.addCategory,
            cancel: widget.controller.addCategoryCancel,
            content: Container(
              padding: EdgeInsets.symmetric(vertical: 13),
              width: 233,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 10, bottom: 5),
                    child: Text(
                      "parent ဖြစ်ပါက ရွေးရန်မလိုပါ။",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 10, color: Colors.purple),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "အမျိုးအစား",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      FutureBuilder(
                        future: widget.controller.getCategories(),
                        builder: (context, snapshotData) {
                          if (snapshotData.data != null) {
                            return SizedBox(
                              width: 144,
                              child: DropdownMenu(
                                dropdownMenuEntries: snapshotData.data!
                                    .map(
                                      (e) => DropdownMenuEntry(
                                          label: e.name, value: e),
                                    )
                                    .toList(),
                                onSelected: (x) {
                                  widget.controller.addEditTmpCategory
                                      .parentProductCategory = x;
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
          return getIt<OCDialogComponent>().setData(oCDialogModel);
        });
  }
}
