import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:photo_view/photo_view.dart';

import 'app_bar.dart';
import 'preview_img_view.dart';
import 'scanned_page.dart';

/// {@template scan_view}
/// A [StatelessWidget] which reacts to the provided
/// [PreviewImgCubit] state and notifies it in response to user input.
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro preview_img_view}
  HomePage({super.key});

  MultiSplitView multiSplitView = MultiSplitView(
    controller: MultiSplitViewController(areas: [Area(weight: 0.5)]),
    children: [
      PreviewImgView(),
      ScannedPageView(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      // backgroundColor: Theme.of(context).backgroundColor,
      body: MultiSplitViewTheme(
        child: multiSplitView,
        data: MultiSplitViewThemeData(
          dividerPainter: DividerPainters.grooved1(
              color: Colors.indigo[100]!,
              highlightedColor: Colors.indigo[900]!),
        ),
      ),
    );
  }
}
