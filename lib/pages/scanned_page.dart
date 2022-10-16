import 'dart:math';

import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';

import 'async_paginated_data_table2.dart';
import 'scan_op_view.dart';

/// {@template scan_view}
/// A [StatelessWidget] which reacts to the provided
/// [PreviewImgCubit] state and notifies it in response to user input.
/// {@endtemplate}
class ScannedPageView extends StatelessWidget {
  /// {@macro preview_img_view}
  const ScannedPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return Column(
      children: <Widget>[
        Container(
          height: 400,
          constraints: BoxConstraints(minHeight: 300),
          //   constraints: BoxConstraints(minHeight: 300),
          child: AsyncPaginatedDataTable2Demo(),
          //      ),
        ),
        Container(
          //  height: 150,
          //constraints: BoxConstraints(minHeight: 180),
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(),
          ),
        ),
        Container(
          // height: 50,
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ScanOpView(),
          ),
        )
      ],
    );
  }
}
