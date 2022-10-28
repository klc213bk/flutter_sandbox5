import 'dart:io';

import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../controller/new_scan_2_controller.dart';

/// {@template scan_view}
/// A [StatelessWidget] which reacts to the provided
/// [PreviewImgCubit] state and notifies it in response to user input.
/// {@endtemplate}
class PreviewImgView extends StatelessWidget {
  /// {@macro preview_img_view}
  PreviewImgView({super.key});

  NewScan2Controller controller = Get.find<NewScan2Controller>();

  @override
  Widget build(BuildContext context) {
    PhotoViewScaleStateController scaleStateController =
        PhotoViewScaleStateController();

    return GetX<NewScan2Controller>(builder: (controller) {
      print('preview_img_view.dart, value:${controller.selectedRx.value}');
      if (controller.selectedRx.value == null) {
        scaleStateController.scaleState = PhotoViewScaleState.originalSize;
        var imageFilePath = 'images/tgl-logo.png';
        return PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border(
                right: BorderSide(
                    width: 2,
                    color: (Theme.of(context).appBarTheme.backgroundColor)
                        as Color)),
          ),
          imageProvider: AssetImage(imageFilePath!),
          filterQuality: FilterQuality.medium,
          scaleStateController: scaleStateController,
        );
      } else {
        scaleStateController.scaleState = PhotoViewScaleState.initial;
        var imageFilePath = controller.selectedRx.value?.getFileImageFilePath();
        return PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border(
                right: BorderSide(
                    width: 2,
                    color: (Theme.of(context).appBarTheme.backgroundColor)
                        as Color)),
          ),
          imageProvider: FileImage(File(imageFilePath!)),
          filterQuality: FilterQuality.medium,
          scaleStateController: scaleStateController,
        );
      }
    });
  }
}
