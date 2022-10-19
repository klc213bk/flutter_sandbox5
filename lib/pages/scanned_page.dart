import 'dart:math';

import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';

import '../widgets/divider.dart';
import '../widgets/settings/dd_paper_side.dart';
import 'async_paginated_data_table2.dart';
import 'data_table2_scrollup.dart';
import 'settings_view.dart';
import 'filing_view.dart';

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
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            constraints: BoxConstraints(minHeight: 300),
            padding: EdgeInsets.all(10),
            margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: AsyncPaginatedDataTable2Demo(),
            //      ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: FilingView(),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: SettingsView(),
        ),
      ],
    );
  }
}
