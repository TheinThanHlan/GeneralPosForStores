import 'package:flutter/material.dart';
import 'package:general_pos/data/all.dart';
import '../../mvc_template/all.dart';
import './ManageProductTemplateController.dart';
import '../Components/OCDialog/OCDialogComponent.dart';
import '../Components/OCDialog/OCDialogModel.dart';

class Tablet extends StatefulWidget {
  late final ManageProductTemplateController controller;
  Tablet({required this.controller});

//  Widget build(BuildContext context) {
//    return Text(controller.greet);
//  }

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
        Expanded(
          flex: 13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: getIt<GlobalConfig>().width,
                child: TextFormField(
                  controller: widget.controller.searchController,
                  //get the keyboard events
                  onChanged: (x) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    label: Text("ရှာဖွေရန်"),
                    //textinput clear text
                    suffixIcon: InkWell(
                      child: Icon(Icons.clear),
                      onTap: () {
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
                          //widget.controller.addProductTemplate();
                          if (!widget
                              .controller.searchController.text.isEmpty) {
                            getIt<ProductTemplateDao>()
                                .searchWithName(
                                    widget.controller.searchController.text)
                                .then((x) {
                              if (x.length == 0) {
                                openAddOcDialog().then((a) {
                                  setState(() {});
                                });
                              }
                            });
                          }
                        },
                        child: Text("အသစ် ထည့်ရန်"))),
              )
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            alignment: Alignment.centerLeft,
            child: widget.controller.searchController.text.isNotEmpty
                ? Text("ရှာဖွေ ထားသော ရလဒ်များ",
                    style: TextStyle(color: Colors.green))
                : Container(),
          ),
        ),
        Expanded(
          flex: 100 - 13 - 5,
          child: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: widget.controller.getProductTemplate(
                    searchName: widget.controller.searchController.text),
                builder: (context, dataSnapshot) {
                  if (dataSnapshot.data != null) {
                    return DataTable(
                      columns: [
                        //DataColumn(label: Text("စဉ်")),
                        DataColumn(label: Text("အမည်")),
                        DataColumn(label: Text(""))
                      ],
                      rows: [
                        ...dataSnapshot.data!.entries.map((a) {
                          return DataRow(cells: [
                            DataCell(Text(a.value.name)),
                            DataCell(OutlinedButton(
                              child: Text("ဖျက်မည်"),
                              onPressed: () {
                                getIt<ProductTemplateDao>()
                                    .delete(a.key)
                                    .then((x) {
                                  setState(() {});
                                });
                              },
                            ))
                          ]);
                        }).toList()
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

  Future openAddOcDialog() {
    var model = OCDialogModel(
      cancel: widget.controller.resetAllFields,
      error_message: widget.controller.showDialogErrorMessage,
      title: "အမျိုးအစား",
      ok: widget.controller.addProductTemplate,
      content: Container(
        width: 233,
        padding: EdgeInsets.symmetric(vertical: 34),
        child: StatefulBuilder(
          builder: (context, state) {
            return Column(
              children: [
                FutureBuilder(
                  future: getIt<ProductCategoryDao>().readExclude(
                      widget.controller.addEditTmpProductTemplate.categories ??
                          []),
                  builder: (context, dataSnapshot) {
                    if (dataSnapshot.data != null) {
                      return Container(
                        height: 89,
                        width: 233,
                        child: ListView.builder(
                          itemCount: dataSnapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                dataSnapshot.data![index].name,
                                style: TextStyle(fontSize: 13),
                              ),
                              onTap: () {
                                widget.controller.addEditTmpProductTemplate
                                    .categories!
                                    .add(dataSnapshot.data![index]);
                                state(() {});
                              },
                              trailing: Icon(Icons.add),
                            );
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                Container(
                  child: Text("ရွေးချယ်ထားသော အမျိုးအစားများ",
                      style: TextStyle(fontSize: 10)),
                ),
                Container(
                  height: 89,
                  width: 233,
                  child: ListView.builder(
                    itemCount: widget.controller.addEditTmpProductTemplate
                        .categories!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          widget
                              .controller.addEditTmpProductTemplate.categories!
                              .removeAt(index);
                          state(() {});
                        },
                        title: Text(
                          widget.controller.addEditTmpProductTemplate
                              .categories![index].name,
                          style: TextStyle(fontSize: 13),
                        ),
                        trailing: Icon(Icons.remove),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
    return showDialog(
        context: context,
        builder: (context) {
          return getIt<OCDialogComponent>().setData(model);
        });
  }
}
