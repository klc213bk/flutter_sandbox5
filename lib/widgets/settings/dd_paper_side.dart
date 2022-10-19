import 'package:flutter/material.dart';

class DropdownButton_PaperSide extends StatefulWidget {
  final String title;
  DropdownButton_PaperSide({this.title = 'Demo'});
  @override
  _PaperSideState createState() => _PaperSideState();
}

class _PaperSideState extends State<DropdownButton_PaperSide> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DropdownButton<String>(
        value: dropdownValue,
        isDense: true,
        isExpanded: true,
        hint: Text('Select a color'),
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Red', 'Green', 'Blue']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
