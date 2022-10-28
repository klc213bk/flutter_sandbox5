import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart';

class ImageRecordSet {
  ImageRecordSet(this.records);

  List<Records>? records;

  String toXml(String leadingSpace) {
    var sb = StringBuffer();
    sb.writeln('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
    sb.writeln('<ImageRecordSet>');
    records?.forEach((element) {
      sb.write(element.toXml(leadingSpace));
    });
    sb.writeln('</ImageRecordSet>');
    return sb.toString();
  }
}

class Records {
  Records(this.recordList);

  List<Record>? recordList;

  String toXml(String leadingSpace) {
    var sb = StringBuffer();
    sb.writeln('$leadingSpace<Records>');
    recordList?.forEach((element) {
      sb.write(element.toXml('$leadingSpace    '));
    });
    sb.writeln('$leadingSpace</Records>');
    return sb.toString();
  }
}

class Record {
  Record(
    this.fileName,
    this.fieldList,
  );
  String? fileName;
  List<Field>? fieldList;

  factory Record.fromXmlElement(XmlElement xmlElement) {
    return Record(
        xmlElement.getAttribute('fileName'),
        xmlElement
            .findAllElements('Field')
            .map((fieldElement) => Field.fromXmlElement(fieldElement))
            .toList());
  }

  @override
  String toString() {
    var f = fieldList?.map((e) => e.toString()).toList();
    f?.join(",");

    return 'Record{'
        'fileName: $fileName,'
        'fieldList:{'
        '${f?.join(",")}'
        '}'
        '}';
  }

  String toXml(String leadingSpace) {
    var sb = StringBuffer();
    sb.writeln('$leadingSpace<Record fileName="$fileName">');
    fieldList?.forEach((element) {
      sb.write(element.toXml('$leadingSpace    '));
    });
    sb.writeln('$leadingSpace</Record>');
    return sb.toString();
  }

  String getImageFilePath() {
    var it = fieldList?.iterator;
    var imageSaveDir = '';
    var fileName = '';
    while (it!.moveNext()) {
      if (it.current.name == 'imageSaveDir') {
        imageSaveDir = it.current.value!;
        continue;
      }
      if (it.current.name == 'fileName') {
        fileName = it.current.value!;
        continue;
      }
    }
    if (imageSaveDir.isEmpty || fileName.isEmpty) {
      throw Exception('image file does not exists');
    }
    return '$imageSaveDir$fileName';
  }
}

class Field {
  Field(
    this.name,
    this.value,
    this.text,
  );

  String? name;
  String? value;
  String? text;

  factory Field.fromXmlElement(XmlElement xmlElement) => Field(
      xmlElement.getAttribute('name'),
      xmlElement.getAttribute('value'),
      xmlElement.getAttribute('text'));

  @override
  String toString() {
    return 'Field{name: $name,'
        'value: $value,'
        'text: $text}';
  }

  String toXml(String leadingSpace) {
    var sb = StringBuffer();
    if (value == null && text == null) {
      sb.writeln('$leadingSpace<Field name="$name"/>');
    } else if (value != null && text == null) {
      sb.writeln('$leadingSpace<Field name="$name" value="$value"/>');
    } else if (value == null && text != null) {
      sb.writeln('$leadingSpace<Field name="$name" text="$text"/>');
    } else {
      sb.writeln(
          '$leadingSpace<Field name="$name" value="$value" text="$text"/>');
    }
    return sb.toString();
  }
}
