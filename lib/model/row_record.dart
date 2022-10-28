import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import 'image_record.dart';

class RowRecord {
  String key = '';
  //V序號
  String seqNo = '';
//V文件編號
  String fileCode = '';
  //V影像主類型
  String mainFileType = '';
  //V影像子類型
  String fileType = '';
  //V頁碼
  String filePage = '';
  //V掃描日期/時間
  String scanTime = '';
  //V備註
  String remark = '';

  String imageSaveDir = '';

  String fileName = '';

  bool selected = false;

  late Record record;

  RowRecord(this.seqNo, this.record) {
    var uuid = const Uuid();
    key = uuid.v4();
    setFields();
  }

  void setFields() {
    for (var element in record.fieldList!) {
      if (element.name == 'FileCode') {
        fileCode = element.value!;
      } else if (element.name == 'MainFileType') {
        mainFileType = element.value!;
      } else if (element.name == 'FileType') {
        fileType = element.value!;
      } else if (element.name == 'FilePage') {
        filePage = element.value!;
      } else if (element.name == 'ScanTime') {
        scanTime = element.value!;
      } else if (element.name == 'Remark') {
        remark = element.value!;
      } else if (element.name == 'imageSaveDir') {
        imageSaveDir = element.value!;
      } else if (element.name == 'fileName') {
        fileName = element.value!;
      }
    }
  }

  String getFileImageFilePath() {
    return '$imageSaveDir$fileName';
  }

  @override
  String toString() {
    return 'RowRecord{ key: $key,'
        'seqNo: $seqNo,'
        'fileCode: $fileCode,'
        'mainFileType: $mainFileType,'
        'fileType: $fileType,'
        'filePage: $filePage,'
        'scanTime: $scanTime,'
        'remark: $remark,'
        'imageSaveDir: $imageSaveDir,'
        'fileName: $fileName}';
  }
}
