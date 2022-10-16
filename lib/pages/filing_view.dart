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
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            '組織編碼',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          width: 300,
          child: TextField(
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: '保費處',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        Text(
          '部室名稱',
          softWrap: false,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          width: 100,
          child: TextField(
            decoration: InputDecoration(
              hintText: '保費處',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    ),
  );
}

class FilingView extends StatelessWidget {
  FilingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        divider(context, '索引設置'),
        line1(context),
      ],
    );
  }
}
