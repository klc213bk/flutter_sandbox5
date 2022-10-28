// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:data_table_2/data_table_2.dart';
import '../controller/new_scan_2_controller.dart';
import '../model/row_record.dart';

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// The file was extracted from GitHub: https://github.com/flutter/gallery
// Changes and modifications by Maxim Saplin, 2021

/// Keeps track of selected rows, feed the data into DesertsDataSource
class RestorableDessertSelections extends RestorableProperty<Set<int>> {
  Set<int> _dessertSelections = {};

  /// Returns whether or not a dessert row is selected by index.
  bool isSelected(int index) => _dessertSelections.contains(index);

  /// Takes a list of [Dessert]s and saves the row indices of selected rows
  /// into a [Set].
  void setDessertSelections(List<RowRecord> rowRecords) {
    final updatedSet = <int>{};
    for (var i = 0; i < rowRecords.length; i += 1) {
      var dessert = rowRecords[i];
      if (dessert.selected) {
        updatedSet.add(i);
      }
    }
    _dessertSelections = updatedSet;
    notifyListeners();
  }

  @override
  Set<int> createDefaultValue() => _dessertSelections;

  @override
  Set<int> fromPrimitives(Object? data) {
    final selectedItemIndices = data as List<dynamic>;
    _dessertSelections = {
      ...selectedItemIndices.map<int>((dynamic id) => id as int),
    };
    return _dessertSelections;
  }

  @override
  void initWithValue(Set<int> value) {
    _dessertSelections = value;
  }

  @override
  Object toPrimitives() => _dessertSelections.toList();
}

int _idCounter = 0;

/// Data source implementing standard Flutter's DataTableSource abstract class
/// which is part of DataTable and PaginatedDataTable synchronous data fecthin API.
/// This class uses static collection of deserts as a data store, projects it into
/// DataRows, keeps track of selected items, provides sprting capability
class DessertDataSource extends DataTableSource {
  // DessertDataSource.empty(this.context) {
  //   desserts = [];
  // }

  DessertDataSource(this.context, this.controller,
      [sortedByCalories = false,
      this.hasRowTaps = false,
      this.hasRowHeightOverrides = false,
      this.hasZebraStripes = true]) {
    rowRecords = controller.rowRecordsRx;
    //_desserts;
    // if (sortedByCalories) {
    //   sort((d) => d.calories, true);
    // }
  }

  final BuildContext context;
  NewScan2Controller controller;
  late List<RowRecord> rowRecords; //late List<Dessert> desserts;
  // Add row tap handlers and show snackbar
  bool hasRowTaps = false;
  // Override height values for certain rows
  bool hasRowHeightOverrides = false;
  // Color each Row by index's parity
  bool hasZebraStripes = false;

  // void sort<T>(Comparable<T> Function(Dessert d) getField, bool ascending) {
  //   desserts.sort((a, b) {
  //     final aValue = getField(a);
  //     final bValue = getField(b);
  //     return ascending
  //         ? Comparable.compare(aValue, bValue)
  //         : Comparable.compare(bValue, aValue);
  //   });
  //   notifyListeners();
  // }

  // void updateSelectedDesserts(RestorableDessertSelections selectedRows) {
  //   print('jjjj');
  //   _selectedCount = 0;
  //   for (var i = 0; i < desserts.length; i += 1) {
  //     var dessert = desserts[i];
  //     if (selectedRows.isSelected(i)) {
  //       dessert.selected = true;
  //       _selectedCount += 1;
  //     } else {
  //       dessert.selected = false;
  //     }
  //   }
  //   notifyListeners();
  // }

  @override
  DataRow2 getRow(int index, [Color? color]) {
    var rowRecordsRx = controller.rowRecordsRx;
    final format = NumberFormat.decimalPercentPattern(
      locale: 'en',
      decimalDigits: 0,
    );
    assert(index >= 0);
    if (index >= rowRecordsRx.length) throw 'index > _desserts.length';
    final rowRecord = rowRecordsRx[index];
    //  print('key:$rowRecord index:$index');
    return DataRow2.byIndex(
      index: index,
      selected: rowRecord.selected,
      color: color != null
          ? MaterialStateProperty.all(color)
          : (rowRecord.selected) // modify
              ? MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 39, 50, 123),
                )
              : (hasZebraStripes && index.isEven
                  ? null
                  : MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 248, 248, 239),
                    )),
      onSelectChanged: (value) {
        print(
            'onSelectChanged aa: ${rowRecord.selected}, $value, ${rowRecord.key}');
        // modify
        selectAll(false);

        if (rowRecord.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          rowRecord.selected = value;
          notifyListeners();

          print('onSelectChanged key: ${rowRecord.key}');
          controller.selectItem(rowRecord.key);
        }
      },
      onTap: hasRowTaps
          ? () => _showSnackbar(context, 'Tapped on row ${rowRecord.seqNo}')
          : null,
      onDoubleTap: hasRowTaps
          ? () =>
              _showSnackbar(context, 'Double Tapped on row ${rowRecord.seqNo}')
          : null,
      onLongPress: hasRowTaps
          ? () =>
              _showSnackbar(context, 'Long pressed on row ${rowRecord.seqNo}')
          : null,
      onSecondaryTap: hasRowTaps
          ? () =>
              _showSnackbar(context, 'Right clicked on row ${rowRecord.seqNo}')
          : null,
      onSecondaryTapDown: hasRowTaps
          ? (d) => _showSnackbar(
              context, 'Right button down on row ${rowRecord.seqNo}')
          : null,
      // specificRowHeight:
      //     hasRowHeightOverrides && dessert.fat >= 25 ? 100 : null,
      cells: [
        DataCell(
          Align(
            child: Text(rowRecord.seqNo,
                style: (rowRecord.selected)
                    ? TextStyle(color: Colors.white)
                    : TextStyle(color: Colors.black)),
            alignment: Alignment.centerLeft,
          ),
        ),
        DataCell(
          Align(
            child: Text(rowRecord.fileCode,
                style: (rowRecord.selected)
                    ? TextStyle(color: Colors.white)
                    : TextStyle(color: Colors.black)),
            alignment: Alignment.centerLeft,
          ),
        ),
        DataCell(
          Align(
            child: Text(rowRecord.mainFileType,
                style: (rowRecord.selected)
                    ? TextStyle(color: Colors.white)
                    : TextStyle(color: Colors.black)),
            alignment: Alignment.centerLeft,
          ),
        ),
        DataCell(Align(
          child: Text(rowRecord.fileType,
              style: (rowRecord.selected)
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: Colors.black)),
          alignment: Alignment.centerLeft,
        )),
        DataCell(Align(
          child: Text(rowRecord.filePage,
              style: (rowRecord.selected)
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: Colors.black)),
          alignment: Alignment.centerLeft,
        )),
        DataCell(Align(
          child: Text(rowRecord.scanTime,
              style: (rowRecord.selected)
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: Colors.black)),
          alignment: Alignment.centerLeft,
        )),
        DataCell(Align(
          child: Text(rowRecord.remark,
              style: (rowRecord.selected)
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: Colors.black)),
          alignment: Alignment.centerLeft,
        )),
        DataCell(Text(rowRecord.key)),
      ],
    );
  }

  @override
  int get rowCount => controller.rowRecordsRx.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void selectAll(bool? checked) {
    for (final rowRecord in controller.rowRecordsRx) {
      rowRecord.selected = checked ?? false;
    }
    _selectedCount = (checked ?? false) ? controller.rowRecordsRx.length : 0;
    notifyListeners();
  }
}

int _selectedCount = 0;

_showSnackbar(BuildContext context, String text, [Color? color]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: color,
    duration: const Duration(seconds: 1),
    content: Text(text),
  ));
}
