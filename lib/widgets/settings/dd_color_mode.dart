import 'package:flutter/material.dart';

const List<String> list = <String>['', '黑白', '彩色'];

class DropdownButton_ColorMode extends StatefulWidget {
  const DropdownButton_ColorMode({super.key});

  @override
  State<DropdownButton_ColorMode> createState() =>
      _DropdownButtonState_ColorMode();
}

class _DropdownButtonState_ColorMode extends State<DropdownButton_ColorMode> {
  String dropdownValue = ''; //list.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: DropdownButton<String>(
        value: dropdownValue,
        isExpanded: true,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          width: MediaQuery.of(context).size.width,
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
      ),
    );
  }
}
