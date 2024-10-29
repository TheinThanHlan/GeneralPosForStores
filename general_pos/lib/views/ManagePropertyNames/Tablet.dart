import 'package:flutter/material.dart';
import 'package:general_pos/data/all.dart';
import '../../mvc_template/all.dart';
import './ManagePropertyNamesController.dart';

class Tablet extends StatefulWidget {
  late final ManagePropertyNamesController controller;
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
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border(right: getIt<GlobalConfig>().sepreate_border_side)),
            child: Column(
              children: [
                Container(
                  height: getIt<GlobalConfig>().top_bar,
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
                          },
                          decoration: InputDecoration(
                            label: Text("Search / Add"),

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
                                  widget.controller.addPropertyName(setState);
                                },
                                child: Text("Add Name"))),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: widget.controller.searchController.text.isNotEmpty
                        ? Text("search result",
                            style: TextStyle(color: Colors.green))
                        : Container(),
                  ),
                ),
                Expanded(
                  flex: 100 - 5,
                  child: Container(
                    child: FutureBuilder(
                      future: widget.controller.getPropertyNames(
                          searchName: widget.controller.searchController.text),
                      builder: (context, dataSnapshot) {
                        if (dataSnapshot.data != null) {
                          return ListView(
                            children: [
                              ListTile(title: Text("Property Names")),
                              for (int a = 0;
                                  a < dataSnapshot.data!.length;
                                  a++)
                                ListTile(
                                  title: Text(dataSnapshot.data![a].name),
                                  onTap: () {
                                    widget.controller.currentPropertyName =
                                        dataSnapshot.data![a];
                                    setState(() {});
                                  },
                                  selected: widget
                                          .controller.currentPropertyName.id ==
                                      dataSnapshot.data![a].id,
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      getIt<ProductPropertyNameDao>()
                                          .delete(dataSnapshot.data![a].id!)
                                          .then((x) {
                                        setState(() {});
                                      });
                                    },
                                  ),
                                )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border(right: getIt<GlobalConfig>().sepreate_border_side)),
            child: Column(
              children: [
                Container(
                  height: getIt<GlobalConfig>().top_bar,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 144,
                        child: TextFormField(
                          controller:
                              widget.controller.propertyValueSearchController,
                          //get the keyboard events
                          onChanged: (x) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            label: Text("Search / Add"),

                            //textinput clear text
                            suffixIcon: InkWell(
                              child: Icon(Icons.clear),
                              onTap: () {
                                widget.controller.propertyValueSearchController
                                    .clear();
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
                                  widget.controller.addPropertyValue(setState);
                                },
                                child: Text("Add Value"))),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: widget.controller.propertyValueSearchController.text
                            .isNotEmpty
                        ? Text("search result",
                            style: TextStyle(color: Colors.green))
                        : Container(),
                  ),
                ),
                Expanded(
                  flex: 100 - 5,
                  child: Container(
                    child: FutureBuilder(
                      future: getIt<ProductPropertyDao>()
                          .readFromPropertyName_value_like(
                              widget.controller.currentPropertyName,
                              widget.controller.propertyValueSearchController
                                  .text),
                      builder: (context, dataSnapshot) {
                        if (dataSnapshot.data != null) {
                          return ListView(
                            children: [
                              ListTile(
                                  title: Text(
                                      "Property Values Of '${widget.controller.currentPropertyName.name}'")),
                              for (int a = 0;
                                  a < dataSnapshot.data!.length;
                                  a++)
                                ListTile(
                                  title: Text(dataSnapshot.data![a].value),
                                  onTap: () {},
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      getIt<ProductPropertyDao>()
                                          .delete(dataSnapshot.data![a].id!)
                                          .then((x) {
                                        setState(() {});
                                      });
                                    },
                                  ),
                                )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
