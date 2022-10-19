import 'package:flutter/material.dart';

Widget batchDeleteBtn(BuildContext context) {
  return Container(
    height: Theme.of(context).buttonTheme.height, //height of button
    width: Theme.of(context).buttonTheme.minWidth,
    margin: EdgeInsets.fromLTRB(3, 10, 3, 0),
    child: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ))),
      onPressed: () {},
      child: Text(
        '整批刪除',
        softWrap: false,
      ),
    ),
  );
}
