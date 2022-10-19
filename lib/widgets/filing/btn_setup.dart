import 'package:flutter/material.dart';

Widget setupBtn(BuildContext context) {
  return Container(
    height: Theme.of(context).buttonTheme.height, //height of button
    width: Theme.of(context).buttonTheme.minWidth,
    margin: EdgeInsets.fromLTRB(3, 10, 3, 0),
    child: ElevatedButton(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(fontWeight: FontWeight.normal),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ))),
      onPressed: () {},
      child: Text(
        '配置',
        softWrap: false,
      ),
    ),
  );
}
