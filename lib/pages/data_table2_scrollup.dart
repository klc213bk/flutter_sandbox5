import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_sources.dart';
import '../controller/new_scan_2_controller.dart';

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// The file was extracted from GitHub: https://github.com/flutter/gallery
// Changes and modifications by Maxim Saplin, 2021

class DataTable2ScrollupDemo extends StatefulWidget {
  const DataTable2ScrollupDemo({super.key});

  @override
  DataTable2ScrollupDemoState createState() => DataTable2ScrollupDemoState();
}

class DataTable2ScrollupDemoState extends State<DataTable2ScrollupDemo> {
  // int? _sortColumnIndex;
  // late DessertDataSource _dessertsDataSource;
  bool _initialized = false;
  final ScrollController _controller = ScrollController();

// NewScan2Controller controller = Get.find<NewScan2Controller>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      //     _dessertsDataSource = DessertDataSource(context, controller);
      _initialized = true;
      // _dessertsDataSource.addListener(() {
      //   setState(() {});
      // });
    }
  }

  @override
  void dispose() {
    //   _dessertsDataSource.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<NewScan2Controller>(
      builder: (controller) {
        print("count 1 rebuild");
        DessertDataSource _dessertsDataSource =
            DessertDataSource(context, controller);
        return Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(children: [
              Theme(
                  // These makes scroll bars almost always visible. If horizontal scroll bar
                  // is displayed then vertical migh be hidden as it will go out of viewport
                  data: ThemeData(
                      scrollbarTheme: ScrollbarThemeData(
                          thumbVisibility: MaterialStateProperty.all(true),
                          thumbColor: MaterialStateProperty.all<Color>(
                              Colors.black38))),
                  child: DataTable2(
                      border: TableBorder(
                          top: const BorderSide(color: Colors.black12),
                          bottom: BorderSide(color: Colors.grey[100]!),
                          left: BorderSide(color: Colors.grey[100]!),
                          right: BorderSide(color: Colors.grey[100]!),
                          verticalInside: BorderSide(color: Colors.grey[100]!),
                          horizontalInside:
                              BorderSide(color: Colors.grey[100]!, width: 1)),
                      showBottomBorder: true,
                      showCheckboxColumn: false,
                      dataTextStyle:
                          Theme.of(context).dataTableTheme.dataTextStyle,
                      headingRowHeight: 24,
                      headingRowColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 191, 193, 185),
                      ),
                      dataRowHeight: 24,
                      scrollController: _controller,
                      columnSpacing: 5,
                      horizontalMargin: 5,
                      bottomMargin: 0,
                      minWidth: 600,
                      //   sortColumnIndex: _sortColumnIndex,
                      // sortAscending: _sortAscending,
                      // onSelectAll: (val) =>
                      //     setState(() => _dessertsDataSource.selectAll(val)),
                      columns: [
                        DataColumn2(
                          label: Center(
                            child: Text('序號',
                                style: Theme.of(context)
                                    .dataTableTheme
                                    .headingTextStyle),
                          ),
                          fixedWidth: 40,
                          // onSort: (columnIndex, ascending) =>
                          //     _sort<String>((d) => d.name, columnIndex, ascending),
                        ),
                        DataColumn2(
                          label: Center(
                            child: Text('文件編號',
                                style: Theme.of(context)
                                    .dataTableTheme
                                    .headingTextStyle),
                          ),
                          fixedWidth: 100,
                          numeric: true,
                          // onSort: (columnIndex, ascending) =>
                          //     _sort<num>((d) => d.calories, columnIndex, ascending),
                        ),
                        DataColumn2(
                          label: Center(
                            child: Text('影像主類型',
                                style: Theme.of(context)
                                    .dataTableTheme
                                    .headingTextStyle),
                          ),
                          fixedWidth: 90,
                          numeric: true,
                          // onSort: (columnIndex, ascending) =>
                          //     _sort<num>((d) => d.fat, columnIndex, ascending),
                        ),
                        DataColumn2(
                          label: Center(
                            child: Text('影像子類型',
                                style: Theme.of(context)
                                    .dataTableTheme
                                    .headingTextStyle),
                          ),
                          fixedWidth: 200,
                          numeric: true,
                          // onSort: (columnIndex, ascending) =>
                          //     _sort<num>((d) => d.carbs, columnIndex, ascending),
                        ),
                        DataColumn2(
                          label: Center(
                            child: Text('頁碼',
                                style: Theme.of(context)
                                    .dataTableTheme
                                    .headingTextStyle),
                          ),
                          fixedWidth: 30,
                          numeric: true,
                          // onSort: (columnIndex, ascending) =>
                          //     _sort<num>((d) => d.protein, columnIndex, ascending),
                        ),
                        DataColumn2(
                          label: Center(
                            child: Text('掃描日期/時間',
                                style: Theme.of(context)
                                    .dataTableTheme
                                    .headingTextStyle),
                          ),
                          fixedWidth: 120,
                          numeric: true,
                          // onSort: (columnIndex, ascending) =>
                          //     _sort<num>((d) => d.sodium, columnIndex, ascending),
                        ),
                        DataColumn2(
                          label: Center(
                            child: Text('備註',
                                style: Theme.of(context)
                                    .dataTableTheme
                                    .headingTextStyle),
                          ),
                          fixedWidth: 40,
                          numeric: true,
                          // onSort: (columnIndex, ascending) =>
                          //     _sort<num>((d) => d.calcium, columnIndex, ascending),
                        ),
                        DataColumn2(
                          label: Text('',
                              style: Theme.of(context)
                                  .dataTableTheme
                                  .headingTextStyle),
                          size: ColumnSize.S,
                          numeric: true,
                          // onSort: (columnIndex, ascending) =>
                          //     _sort<num>((d) => d.iron, columnIndex, ascending),
                        ),
                      ],
                      empty: Center(
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              child: const Text('表格中沒有內容'))),
                      rows: List<DataRow>.generate(_dessertsDataSource.rowCount,
                          (index) => _dessertsDataSource.getRow(index)))),
              _ScrollUpButton(_controller)
            ]));
      },
    );
  }
}

class _ScrollUpButton extends StatefulWidget {
  const _ScrollUpButton(this.controller);

  final ScrollController controller;

  @override
  _ScrollUpButtonState createState() => _ScrollUpButtonState();
}

class _ScrollUpButtonState extends State<_ScrollUpButton> {
  bool _showScrollUp = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.position.pixels > 20 && !_showScrollUp) {
        setState(() {
          _showScrollUp = true;
        });
      } else if (widget.controller.position.pixels < 20 && _showScrollUp) {
        setState(() {
          _showScrollUp = false;
        });
      }
      // On GitHub there was a question on how to determine the event
      // of widget being scrolled to the bottom. Here's the sample
      // if (widget.controller.position.hasViewportDimension &&
      //     widget.controller.position.pixels >=
      //         widget.controller.position.maxScrollExtent - 0.01) {
      //   print('Scrolled to bottom');
      //}
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showScrollUp
        ? Positioned(
            right: 10,
            bottom: 10,
            child: OutlinedButton(
              onPressed: () => widget.controller.animateTo(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              child: const Text('↑↑ go up ↑↑'),
            ))
        : const SizedBox();
  }
}
