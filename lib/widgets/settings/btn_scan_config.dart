import 'package:flutter/material.dart';

class Button_ScanSource extends StatefulWidget {
  const Button_ScanSource({super.key});

  @override
  State<Button_ScanSource> createState() => _ButtonState_ScanSource();
}

class _ButtonState_ScanSource extends State<Button_ScanSource> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
        '掃描配置',
        softWrap: false,
      ),
    );
  }
}
