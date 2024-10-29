import 'package:flutter/material.dart';
import './OCDialogModel.dart';
import '../../../mvc_template/all.dart';

class Tablet extends StatefulWidget {
  late OCDialogModel data;
  Tablet({required this.data});

//  Widget build(BuildContext context) {
//    return Container();
//  }

  State<StatefulWidget> createState() {
    return _Tablet();
  }
}

class _Tablet extends State<Tablet> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          widget.data.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.left,
        ),
        scrollable: true,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.error_message.toString(),
              style: TextStyle(color: Colors.red, fontSize: 8),
            ),
            widget.data.content,
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              widget.data.cancel!();
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          OutlinedButton(
            onPressed: () {
              widget.data.ok().then((x) {
                if (x == true) {
                  Navigator.of(context).pop();
                  widget.data.cancel!();
                } else {
                  setState(() {});
                }
              });
            },
            child: Text("Ok"),
          ),
        ]
        /*
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.error_message.toString(),
              style: TextStyle(color: Colors.red, fontSize: 8),
            ),
            widget.data.content,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      widget.data.cancel!();
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 5, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      widget.data.ok().then((x) {
                        if (x == true) {
                          Navigator.of(context).pop();
                          widget.data.cancel!();
                        } else {
                          setState(() {});
                        }
                      });
                    },
                    icon: Text("Ok"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      */
        );
  }
}

/*
class _Tablet extends State<Tablet> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.title,
              style: TextStyle(fontSize: 21),
              textAlign: TextAlign.left,
            ),
            Text(
              widget.data.error_message.toString(),
              style: TextStyle(color: Colors.red, fontSize: 8),
            ),
            widget.data.content,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      widget.data.cancel!();
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 5, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      widget.data.ok().then((x) {
                        if (x == true) {
                          Navigator.of(context).pop();
                          widget.data.cancel!();
                        } else {
                          setState(() {});
                        }
                      });
                    },
                    icon: Text("Ok"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

*/
