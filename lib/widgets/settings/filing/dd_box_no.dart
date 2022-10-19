import 'package:flutter/material.dart';

const List<String> boxNoList = <String>[''];

Widget boxNo = DropdownButton<String>(
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
  items: boxNoList.map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
);
