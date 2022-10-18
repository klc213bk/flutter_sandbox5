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

Widget line1(BuildContext context) {
  return SizedBox(
    child: Flex(
      direction: Axis.horizontal,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            '紙張來源',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: paperSided,
        ),
        Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            '影像模式',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: colorMode,
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 10),
          child: Button_ScanSource(),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Text(
              '*未設定',
              softWrap: false,
            ),
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

Widget paperSided = DropdownButton<String>(
  // value: dropdownValue,
  hint: Text(''),
  isDense: true,
  icon: const Icon(Icons.arrow_drop_down),
  onChanged: (String? newValue) {
    // setState(() {
    //   dropdownValue = newValue!;
    // });
  },
  items: <String>['單面', '雙面'].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
);

Widget colorMode = DropdownButton<String>(
  // value: dropdownValue,
  hint: Text(''),
  isDense: true,
  icon: const Icon(Icons.arrow_drop_down),
  elevation: 16,
  onChanged: (String? value) {
    // This is called when the user selects an item.
    // setState(() {
    //   dropdownValue = value!;
    // });
  },
  items: <String>['黑白', '彩色'].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
);
