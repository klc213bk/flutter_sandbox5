// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_size/window_size.dart';

import 'home_bindings.dart';
import 'pages/home.dart';
import 'themes/themes.dart';
import 'init.dart';
import 'splash_screen.dart';

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

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future _initFuture = Init.initialize();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'New Scan2',
      //  themeMode: ThemeMode.light,
      theme: ThemeClass.lightTheme,
      // darkTheme: ThemeClass.darkTheme,
      initialBinding: HomeBindings(),
      home: FutureBuilder(
        future: _initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}
