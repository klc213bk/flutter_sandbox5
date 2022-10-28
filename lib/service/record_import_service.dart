import 'dart:convert';
import 'dart:io';

import 'package:xml/xml.dart';

import '../model/image_record.dart';

class RecordImportSerice {
  Future<List<Record>> import() async {
    var file = File(r'C:\TGL-Scan-Test-2\config\imagerecordset.xml');
    String xml = '';
    try {
      //  await Future.delayed(const Duration(seconds: 1));
      xml = await readFile(file);
    } catch (e) {
      rethrow;
    }
    try {
      final document = XmlDocument.parse(xml);

      var recordXmlElementList = document.findAllElements('Record');
      var recordList = recordXmlElementList
          .map((recordElement) => Record.fromXmlElement(recordElement))
          .toList();

      return recordList;
    } catch (e) {
      rethrow;
    }
    //recordList.forEach(print);
  }

  Future<String> readFile(File file) async {
    StringBuffer sb = StringBuffer();

    try {
      Stream<String> lines = file
          .openRead()
          .transform(utf8.decoder) // Decode bytes to UTF-8.
          .transform(
              const LineSplitter()); // Convert stream to individual lines.

      await for (var line in lines) {
        print('$line: ${line.length} characters');
        sb.writeln(line);
      }
      print('File is now closed.');
    } catch (e) {
      rethrow;
    }
    return sb.toString();
  }

  // Future<List<Record>> fetchProducts() async {
  //   final response = await get(
  //       'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
  //   if (response.status.hasError) {
  //     return Future.error(response.statusText);
  //   } else {
  //     return makeupModelFromJson(response.bodyString);
  //   }
  // }

}
