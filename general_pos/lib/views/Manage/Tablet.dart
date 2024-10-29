import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../mvc_template/all.dart';
import './ManageController.dart';

class Tablet extends StatefulWidget {
  late final ManageController controller;
  Tablet({required this.controller});

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Tablet();
  }
}

class _Tablet extends State<Tablet> with SingleTickerProviderStateMixin {
  late TabController tabController;
  void initState() {
    tabController =
        TabController(length: widget.controller.pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //   Container(
        //     height: getIt<GlobalConfig>().top_bar,
        //     child: Scrollbar(
        //       controller: widget.controller.scrollController,
        //       thickness: 3,
        //       thumbVisibility: true,
        //       child: ListView(
        //         controller: widget.controller.scrollController,
        //         scrollDirection: Axis.horizontal,
        //         children: [
        //           ...widget.controller.getPageList(setState),
        //         ],
        //       ),
        //     ),
        //   ),
        //Expanded(flex: 100 - 8, child: widget.controller.currentPage["page"])
        Container(
          height: getIt<GlobalConfig>().top_bar,
          child: TabBar(controller: this.tabController, tabs: [
            ...widget.controller.getTabList(setState),
          ]),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              ...widget.controller.pages.map((a) {
                return a["page"];
              }).toList()
            ],
          ),
        ),
      ],
    );
  }
}
