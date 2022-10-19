import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/divider.dart';
import '../widgets/settings/btn_scan.dart';
import '../widgets/settings/btn_scan_config.dart';
import '../widgets/settings/dd_color_mode.dart';
import '../widgets/settings/dd_paper_side.dart';

class SettingsView extends StatelessWidget {
  SettingsView({
    Key? key,
  }) : super(key: key) {
    leftMargin = const EdgeInsets.only(left: 5.0);
    rightMargin = const EdgeInsets.only(right: 5.0);
    ratio1 = 0.07;
    ratio2 = 0.07;
    ratio3 = 0.07;
    ratio4 = 0.07;
    ratio5 = 0.15;
    ratio6 = 0.1;
    // remain
  }

  late final EdgeInsets leftMargin;
  late final EdgeInsets rightMargin;
  late final double ratio1;
  late final double ratio2;
  late final double ratio3;
  late final double ratio4;
  late final double ratio5;
  late final double ratio6;

  @override
  Widget build(BuildContext context) {
    final double mediaQueryWidth = 0.61 * MediaQuery.of(context).size.width;
    return Column(
      children: [
        divider(context, '影像操作'),
        settings_line1(context, mediaQueryWidth),
      ],
    );
  }

  Widget settings_line1(BuildContext context, double mediaQueryWidth) {
    return Row(
      children: [
        Container(
          margin: leftMargin,
          width: mediaQueryWidth * ratio1,
          child: new Text(
            "紙張來源",
            softWrap: false,
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: mediaQueryWidth * ratio2,
          child: paperSided,
        ),
        Container(
          margin: leftMargin,
          width: mediaQueryWidth * ratio3,
          child: new Text(
            "影像模式",
            softWrap: false,
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          width: mediaQueryWidth * ratio4,
          child: paperSided,
        ),
        Container(
          width: mediaQueryWidth * ratio5,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 10),
          child: Button_ScanSource(),
        ),
        Container(
          margin: leftMargin,
          width: mediaQueryWidth * ratio6,
          child: new Text(
            "*未設定",
            softWrap: false,
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          flex: 1,
          child: Button_Scan(),
        ),
      ],
    );
  }
}
