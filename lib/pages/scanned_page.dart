import 'package:flutter/material.dart';
import 'settings_view.dart';
import 'filing_view.dart';
import 'data_table2_scrollup.dart';

/// {@template scan_view}
/// A [StatelessWidget] which reacts to the provided
/// [PreviewImgCubit] state and notifies it in response to user input.
/// {@endtemplate}
class ScannedPageView extends StatelessWidget {
  /// {@macro preview_img_view}
  const ScannedPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            constraints: BoxConstraints(minHeight: 350),
            padding: EdgeInsets.all(1),
            margin: const EdgeInsets.fromLTRB(0, 5, 5, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: DataTable2ScrollupDemo(),
            //      ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(0, 5, 5, 0),
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
