import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/btn_scan.dart';
import '../widgets/btn_scan_config.dart';
import '../widgets/dd_color_mode.dart';
import '../widgets/dd_paper_side.dart';

Widget divider(BuildContext context) {
  return SizedBox(
    child: Flex(
      direction: Axis.horizontal,
      children: [
        // Row(
        //   children: <Widget>[
        // Expanded(
        //   flex: 1,
        //   child:
        Container(
          width: 50,
          margin: const EdgeInsets.only(left: 5.0, right: 10.0),
          child: const Divider(
            color: Colors.black45,
            thickness: 3,
            height: 1,
          ),
          //),
        ),
        // Expanded(
        //   flex: 1,
        //   child:
        Text(
          '影像操作',
          softWrap: false,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        // ),
        Expanded(
          // flex: 20,
          child: Container(
              width: 50,
              margin: const EdgeInsets.only(left: 10.0, right: 5.0),
              child: const Divider(
                color: Colors.black45,
                thickness: 3,
                height: 1,
              )),
        ),
        //     ],
        //  ),
      ],
    ),
  );
}

Widget divider1(BuildContext context) {
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

// return //Row(
// children: [
//   Container(
//    margin: const EdgeInsets.only(left: 5.0, right: 5.0),
//   child:
//Text('紙張來源'); //,
//   ),
// DropdownButton_PaperSide(),
// Text('影像模式'),
// DropdownButton_ColorMode(),
// Button_ScanSource(),
// Text('未設定'),
// Expanded(
//   flex: 1,
//   child: Button_Scan(),
// ),
//  ],
// );
//}

class ScanOpView extends StatelessWidget {
  ScanOpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        divider(context),
        divider1(context),
      ],
    );
  }
}
