import 'package:pdf/widgets.dart';
import './PrintVoucherModel.dart';
import '../../../mvc_template/all.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';

class PrintVoucherComponent extends StatelessWidget {
  late PrintVoucherModel data;
  PrintVoucherComponent setData(PrintVoucherModel data) {
    this.data = data;
    return this;
  }

  PrintVoucherComponent({required this.data});

  @override
  Widget build(context) {
    var currentDateTime = DateTime.now();
    var voucherTextStyle = TextStyle(fontSize: 8);
    double trSpace = 5;
    var rowSpacer = TableRow(children: [
      SizedBox(height: trSpace),
      SizedBox(height: trSpace),
      SizedBox(height: trSpace),
      SizedBox(height: trSpace)
    ]);

    List<TableRow> voucherTableRow = [];
    for (var a in data.voucher.ListOfOrder_mappedBy_voucher!) {
      voucherTableRow.add(TableRow(
        children: [
          Text(
              a.item.productTemplate!.name +
                  " " +
                  a.item.productProperties!.map((x) => x.value).join(" "),
              style: voucherTextStyle,
              softWrap: true),
          Text(a.item.currentPrice.price.toString(),
              style: voucherTextStyle, textAlign: TextAlign.end),
          Text(a.qty.toString(),
              style: voucherTextStyle, textAlign: TextAlign.end),
          Text((a.qty * a.item.currentPrice.price).toString(),
              style: voucherTextStyle, textAlign: TextAlign.end),
        ],
      ));
      voucherTableRow.add(rowSpacer);
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        //Date Time
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Date " +
                    currentDateTime.year.toString() +
                    "/" +
                    currentDateTime.month.toString() +
                    "/" +
                    currentDateTime.day.toString(),
                style: TextStyle(fontSize: 8),
              ),
              Text(
                "Time " +
                    data.voucher.openedTime!.hour.toString() +
                    ":" +
                    data.voucher.openedTime!.minute.toString() +
                    ":" +
                    data.voucher.openedTime!.second.toString() +
                    " to " +
                    currentDateTime.hour.toString() +
                    ":" +
                    currentDateTime.minute.toString() +
                    ":" +
                    currentDateTime.second.toString(),
                style: TextStyle(fontSize: 8),
              ),
            ]),
        //restaurant name
        Container(
            child: Text("OK",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            width: double.maxFinite),

        //table No
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Table No : " + data.voucher.table!.name + " " + data.voucher.name!,
            style: voucherTextStyle,
          ),
        ),
        SizedBox(height: 10),
        Table(
          columnWidths: {
            0: FlexColumnWidth(100 - 21 - 13 - 21),
            1: FlexColumnWidth(21),
            2: FlexColumnWidth(13),
            3: FlexColumnWidth(21)
          },
          tableWidth: TableWidth.max,
          children: [...voucherTableRow],
        ),
        SizedBox(height: 8),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Total : "),
              Text(data.totalPrice.toString(), textAlign: TextAlign.end)
            ]),
        SizedBox(height: 5),
      ],
    );
  }

  void printVoucher() async {
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    final doc = Document(
        theme: ThemeData.withFont(fontFallback: [
      //Font.ttf(await rootBundle.load("assets/fonts/Myanmar3/mm3-multi-os.ttf")),
      Font.ttf(await rootBundle
          .load("assets/fonts/Noto_Sans_Myanmar/NotoSansMyanmar-Regular.ttf")),
      // Font.ttf(await rootBundle
      //     .load('assets/fonts/Padauk-5.001/PadaukBook-Regular.ttf')),
    ]));
    doc.addPage(
      Page(
        pageTheme: PageTheme(
            margin: EdgeInsets.all(2), pageFormat: PdfPageFormat.roll57),
        build: (context) {
          return this;
        },
      ),
    );
    await file.writeAsBytes(await doc.save());

    Printing.layoutPdf(
      onLayout: (_) => doc.save(),
    );
  }
}
