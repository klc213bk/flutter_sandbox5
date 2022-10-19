import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/divider.dart';
import '../widgets/settings/btn_scan.dart';
import '../widgets/settings/btn_scan_config.dart';
import '../widgets/settings/dd_color_mode.dart';
import '../widgets/settings/dd_paper_side.dart';
import '../widgets/settings/filing/dd_box_no.dart';
import '../widgets/settings/filing/dd_dept.dart';
import '../widgets/settings/filing/dd_file_type.dart';
import '../widgets/settings/filing/dd_main_file_type.dart';

class FilingView extends StatelessWidget {
  FilingView({
    Key? key,
  }) : super(key: key) {
    leftMargin = const EdgeInsets.only(left: 5.0);
    rightMargin = const EdgeInsets.only(right: 5.0);
    ratio1 = 0.1;
    ratio2 = 0.13;
    ratio3 = 0.1;
    ratio4 = 0.15;
    ratio5 = 0.12;
    ratio6 = 0.15;
    ratio7 = 0.1;
    ratio8 = 0.14;
  }

  final GlobalKey _filingColumnKey = GlobalKey();

  late final EdgeInsets leftMargin;
  late final EdgeInsets rightMargin;
  late final double ratio1;
  late final double ratio2;
  late final double ratio3;
  late final double ratio4;
  late final double ratio5;
  late final double ratio6;
  late final double ratio7;
  late final double ratio8;

  void _getWidgetInfo() {
    final RenderBox renderBox =
        _filingColumnKey.currentContext?.findRenderObject() as RenderBox;

    final Size size = renderBox.size; // or _widgetKey.currentContext?.size
    print('Size: ${size.width}, ${size.height}');

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    print('Offset: ${offset.dx}, ${offset.dy}');
    print(
        'Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
  }

  @override
  Widget build(BuildContext context) {
    final double mediaQueryWidth = 0.61 * MediaQuery.of(context).size.width;

    // ignore: avoid_print
    print('size:${mediaQueryWidth}');
    print('ratio1:${mediaQueryWidth * ratio1}');
    print('ratio2:${mediaQueryWidth * ratio2}');
    print('ratio3:${mediaQueryWidth * ratio3}');
    print('ratio4:${mediaQueryWidth * ratio4}');
    print('ratio5:${mediaQueryWidth * ratio5}');
    print('ratio6:${mediaQueryWidth * ratio6}');
    print('ratio7:${mediaQueryWidth * ratio7}');
    print('ratio8:${mediaQueryWidth * ratio8}');

    return Column(
      children: [
        divider(context, '索引設置'),
        filing_line1(context, mediaQueryWidth),
        filing_line2(context, mediaQueryWidth),
        filing_line3(context, mediaQueryWidth),
        filing_line4(context, mediaQueryWidth),
        filing_line5(context, mediaQueryWidth),
        filing_line6(context, mediaQueryWidth),
        // line2(context),
      ],
    );
  }

  Widget filing_line1(BuildContext context, double mediaQueryWidth) {
    return Row(
      // key: _filingColumnKey,
      children: [
        Container(
          width: mediaQueryWidth * ratio1,
          margin: leftMargin,
          alignment: Alignment.topLeft,
          child: Text(
            '組織編碼',
            softWrap: false,
          ),
        ),
        Container(
          width: mediaQueryWidth * (ratio2 + ratio3 + ratio4),
          child: TextField(
            style: Theme.of(context).primaryTextTheme.bodyText1,
            decoration: InputDecoration(
              isDense: true,
            ),
          ),
        ),
        Container(
          width: mediaQueryWidth * ratio5,
          child: new Text(
            "部室名稱",
            softWrap: false,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: rightMargin,
            child: TextField(
              style: Theme.of(context).primaryTextTheme.bodyText1,
              decoration: InputDecoration(
                isDense: true,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget filing_line2(BuildContext context, double mediaQueryWidth) {
    return Row(
      children: [
        Container(
          margin: leftMargin,
          width: mediaQueryWidth * ratio1,
          child: new Text(
            "影像主類型",
            softWrap: false,
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: mediaQueryWidth * ratio2,
          child: mainFileType,
        ),
        Container(
          width: mediaQueryWidth * ratio1,
          child: new Text(
            "影像子類型",
            softWrap: false,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: mediaQueryWidth * ratio2,
            child: fileType,
          ),
        ),
      ],
    );
  }

  Widget filing_line3(BuildContext context, double mediaQueryWidth) {
    return Row(
      children: [
        Container(
          margin: leftMargin,
          width: mediaQueryWidth * ratio1,
          child: new Text(
            "文件編號",
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: mediaQueryWidth * (ratio2 + ratio3 + ratio4),
          child: dept,
        ),
        Container(
          width: mediaQueryWidth * ratio5,
          child: new Text(
            "頁碼",
            softWrap: false,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: rightMargin,
            child: TextField(
              style: Theme.of(context).primaryTextTheme.bodyText1,
              decoration: InputDecoration(
                isDense: true,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget filing_line4(BuildContext context, double mediaQueryWidth) {
    return Row(children: [
      Container(
        margin: leftMargin,
        width: mediaQueryWidth * ratio1,
        child: new Text(
          "箱號",
          softWrap: false,
          textAlign: TextAlign.left,
        ),
      ),
      Container(
        width: mediaQueryWidth * ratio2,
        child: boxNo,
      ),
    ]);
  }

  Widget filing_line5(BuildContext context, double mediaQueryWidth) {
    return Row(
      children: [
        Container(
          margin: leftMargin,
          width: mediaQueryWidth * ratio1,
          child: new Text(
            "批次號碼\n部門別",
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: mediaQueryWidth * ratio2,
          child: dept,
        ),
        Container(
          width: mediaQueryWidth * ratio3,
          child: new Text(
            "日期",
            softWrap: false,
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          width: mediaQueryWidth * ratio4,
          child: TextField(
            style: Theme.of(context).primaryTextTheme.bodyText1,
            decoration: InputDecoration(
              isDense: true,
            ),
          ),
        ),
        // ),
        Container(
          width: mediaQueryWidth * ratio5,
          child: new Text(
            "分區",
            softWrap: false,
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          width: mediaQueryWidth * ratio6,
          child: TextFormField(
            style: Theme.of(context).primaryTextTheme.bodyText1,
            decoration: InputDecoration(
              isDense: true,
            ),
          ),
        ),
        Container(
          margin: leftMargin,
          width: mediaQueryWidth * ratio7,
          child: new Text(
            "文件別",
            softWrap: false,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: rightMargin,
            child: TextField(
              style: Theme.of(context).primaryTextTheme.bodyText1,
              decoration: InputDecoration(
                isDense: true,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget filing_line6(BuildContext context, double mediaQueryWidth) {
    return Row(
      children: [
        Container(
          margin: leftMargin,
          width: mediaQueryWidth * ratio1,
          child: new Text(
            "公司碼\n(團險保單號碼)",
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: mediaQueryWidth * (ratio2 + ratio3 + ratio4),
          child: TextFormField(
            style: Theme.of(context).primaryTextTheme.bodyText1,
            decoration: InputDecoration(
              isDense: true,
            ),
          ),
        ),
        Container(
          margin: leftMargin,
          width: mediaQueryWidth * ratio5,
          child: new Text(
            "個人碼",
            softWrap: false,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: rightMargin,
            child: TextField(
              style: Theme.of(context).primaryTextTheme.bodyText1,
              decoration: InputDecoration(
                isDense: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
