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
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
      onPressed: () {},
      child: Text(
        '掃描配置',
        softWrap: false,
      ),
    );
  }
}
