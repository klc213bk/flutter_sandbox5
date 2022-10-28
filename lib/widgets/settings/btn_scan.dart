import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/new_scan_2_controller.dart';

class Button_Scan extends GetView<NewScan2Controller> {
  const Button_Scan({super.key});

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
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(
              Color.fromARGB(255, 39, 50, 123),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(fontWeight: FontWeight.normal),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ))),
        onPressed: () {
          controller.startScan();
        },
        child: Text(
          '開始掃描',
          softWrap: false,
        ),
      ),
    );
  }
}
