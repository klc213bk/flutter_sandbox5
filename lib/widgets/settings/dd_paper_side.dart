import 'package:flutter/material.dart';

const List<String> paperSidedList = <String>[''];

Widget paperSided = DropdownButton<String>(
  // value: dropdownValue,
  hint: Text(''),
  isDense: true,
  isExpanded: true,
  icon: const Icon(Icons.arrow_drop_down),
  onChanged: (String? newValue) {
    // setState(() {
    //   dropdownValue = newValue!;
    // });
  },
  items: paperSidedList.map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
);
