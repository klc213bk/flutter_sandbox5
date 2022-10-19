import 'package:flutter/material.dart';

class Button_Scan extends StatefulWidget {
  const Button_Scan({super.key});

  @override
  State<Button_Scan> createState() => _ButtonState_Scan();
}

class _ButtonState_Scan extends State<Button_Scan> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(55),
      ),
      elevation: 25.0,
    );

    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {},
        child: Text(
          '開始掃描',
          softWrap: false,
        ),
      ),
    );
  }
}
