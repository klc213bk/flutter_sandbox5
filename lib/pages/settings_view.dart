import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/divider.dart';
import '../widgets/settings/btn_scan.dart';
import '../widgets/settings/btn_scan_config.dart';
import '../widgets/settings/dd_color_mode.dart';
import '../widgets/settings/dd_paper_side.dart';

Widget line1(BuildContext context) {
  return SizedBox(
    child: Flex(
      direction: Axis.horizontal,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            '紙張來源',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        DropdownButton_PaperSide(),
        // Expanded(
        //   flex: 1,
        //   child:
        Text(
          '影像模式',
          softWrap: false,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        DropdownButton_ColorMode(),
        Button_ScanSource(),
        Container(
          margin: const EdgeInsets.only(left: 1.0, right: 5.0),
          child: Text(
            '未設定',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          flex: 1,
          child: Button_Scan(),
        ),
      ],
    ),
  );
}

class SettingsView extends StatelessWidget {
  SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        divider(context, '影像操作'),
        line1(context),
      ],
    );
  }
}
