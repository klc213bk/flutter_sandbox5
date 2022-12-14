import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

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

  MultiSplitView multiSplitView(BuildContext context) {
    return MultiSplitView(
      controller: MultiSplitViewController(
        areas: [
          Area(weight: 0.35, minimalWeight: 0.25),
          Area(minimalWeight: 0.55),
        ],
      ),
      children: [
        PreviewImgView(),
        Container(
          color: Theme.of(context).canvasColor,
          child: ScannedPageView(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      // backgroundColor: Theme.of(context).backgroundColor,
      body: MultiSplitViewTheme(
        child: multiSplitView(context),
        data: MultiSplitViewThemeData(
          dividerPainter: DividerPainters.grooved1(
              backgroundColor: Theme.of(context).canvasColor!,
              color: Colors.grey!,
              highlightedColor: Theme.of(context).backgroundColor!),
        ),
      ),
    );
  }
}
