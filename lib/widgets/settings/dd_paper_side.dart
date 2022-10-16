import 'package:flutter/material.dart';

const List<String> list = <String>['單面', '雙面'];

class DropdownButton_PaperSide extends StatefulWidget {
  const DropdownButton_PaperSide({super.key});

  @override
  State<DropdownButton_PaperSide> createState() =>
      _DropdownButtonState_PaperSide();
}

class _DropdownButtonState_PaperSide extends State<DropdownButton_PaperSide> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: DropdownButton<String>(
        value: dropdownValue,
        isExpanded: true,
        elevation: 16,
        //   isExpanded: true,
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
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }).toList(),
      ),
    );
  }
}
