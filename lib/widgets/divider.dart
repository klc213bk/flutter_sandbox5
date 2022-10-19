import 'package:flutter/material.dart';

Widget divider(BuildContext context, String textString) {
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
          textString,
          softWrap: false,
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
