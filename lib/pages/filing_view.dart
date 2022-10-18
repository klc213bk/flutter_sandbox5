import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/divider.dart';
import '../widgets/settings/btn_scan.dart';
import '../widgets/settings/btn_scan_config.dart';
import '../widgets/settings/dd_color_mode.dart';
import '../widgets/settings/dd_paper_side.dart';
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
        // filing_line1(context, mediaQueryWidth),
        filing_line5(context, mediaQueryWidth),
        // filing_line6(context, mediaQuerySize),
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
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            //   width: 200,
            child: TextFormField(
              style: Theme.of(context).primaryTextTheme.bodyText1,
              decoration: InputDecoration(
                //      hintText: '台北總公司1',
                isDense: true,
                // contentPadding:
                //     EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            '部室名稱',
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 100,
            child: TextFormField(
              style: Theme.of(context).primaryTextTheme.bodyText1,
              decoration: InputDecoration(
                //     hintText: '保費處',
                //   hintStyle: Theme.of(context).primaryTextTheme.bodyText1,
                isDense: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
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
          width: mediaQueryWidth * 0.1,
          margin: leftMargin,
          child: Text(
            '影像主類型',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        DropdownButton_MainFileType(),
        Text(
          '影像子類型',
          softWrap: false,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        DropdownButton_FileType(),
      ],
    );
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
            textAlign: TextAlign.right,
          ),
        ),
        /* Expanded(
          flex: 1,
          child:*/
        Container(
          width: mediaQueryWidth * ratio4,
          child: TextField(
            style: Theme.of(context).primaryTextTheme.bodyText1,
            decoration: InputDecoration(
              //     hintText: '保費處',
              //   hintStyle: Theme.of(context).primaryTextTheme.bodyText1,
              isDense: true,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        // ),
        Container(
          width: mediaQueryWidth * ratio5,
          child: new Text(
            "分區",
            textAlign: TextAlign.right,
          ),
        ),
        /* Expanded(
          flex: 1,
          child:*/
        Container(
          width: mediaQueryWidth * ratio6,
          child: TextFormField(
            style: Theme.of(context).primaryTextTheme.bodyText1,
            decoration: InputDecoration(
              //     hintText: '保費處',
              //   hintStyle: Theme.of(context).primaryTextTheme.bodyText1,
              isDense: true,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        //   ),
        Container(
          margin: leftMargin,
          width: mediaQueryWidth * ratio7,
          child: new Text(
            "文件別",
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
                //     hintText: '保費處',
                //   hintStyle: Theme.of(context).primaryTextTheme.bodyText1,
                isDense: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget filing_line6(BuildContext context, Size mediaSize) {
    return Row(
      children: [
        Container(
          margin: leftMargin,
          width: mediaSize.width * 0.1,
          child: new Text(
            "公司碼\n(團險保單號碼)",
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            //   width: 200,
            child: TextField(
              style: Theme.of(context).primaryTextTheme.bodyText1,
              decoration: InputDecoration(
                //      hintText: '台北總公司1',
                isDense: true,
                // contentPadding:
                //     EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            '部室名稱',
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 100,
            child: TextField(
              style: Theme.of(context).primaryTextTheme.bodyText1,
              decoration: InputDecoration(
                //     hintText: '保費處',
                //   hintStyle: Theme.of(context).primaryTextTheme.bodyText1,
                isDense: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
