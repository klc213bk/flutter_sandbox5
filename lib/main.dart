// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import 'pages/home.dart';
import 'themes/themes.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('新版影像掃描');
    // setWindowMaxSize(const Size(max_width, max_height));
    setWindowMinSize(const Size(1400, 900));
    // Future<Null>.delayed(Duration(seconds: 1), () {
    setWindowFrame(Rect.fromLTWH(100, 100, 1400, 900));
    //  });
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'New Scan2',
      //  themeMode: ThemeMode.light,
      theme: ThemeClass.lightTheme,
      // darkTheme: ThemeClass.darkTheme,
      home: HomePage(),
    );
  }
}
