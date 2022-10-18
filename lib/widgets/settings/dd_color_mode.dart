import 'package:flutter/material.dart';

const List<String> list = <String>['黑白', '彩色'];

class DropdownButton_ColorMode extends StatefulWidget {
  const DropdownButton_ColorMode({super.key});

  @override
  State<DropdownButton_ColorMode> createState() =>
      _DropdownButtonState_ColorMode();
}

class _DropdownButtonState_ColorMode extends State<DropdownButton_ColorMode> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isDense: true,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
