import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

/// {@template scan_view}
/// A [StatelessWidget] which reacts to the provided
/// [PreviewImgCubit] state and notifies it in response to user input.
/// {@endtemplate}
class PreviewImgView extends StatelessWidget {
  /// {@macro preview_img_view}
  const PreviewImgView({super.key});

  @override
  Widget build(BuildContext context) {
    PhotoViewScaleStateController scaleStateController =
        PhotoViewScaleStateController();
    int i = 0;
    scaleStateController.scaleState =
        i == 0 ? PhotoViewScaleState.originalSize : PhotoViewScaleState.initial;

    String imgName =
        'images/tgl-logo.png'; //2022051213593136201_01038496142.tiff';
    return PhotoView(
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border(
            right: BorderSide(
                width: 5,
                color:
                    (Theme.of(context).appBarTheme.backgroundColor) as Color)),
      ),
      imageProvider: AssetImage(
        imgName,
      ),
      filterQuality: FilterQuality.medium,
      scaleStateController: scaleStateController,
    );
  }
}
