import 'package:flutter/material.dart';

IconButton appIconButon = IconButton(
  // splashRadius: 24,
  iconSize: 24,
  icon: Ink.image(
    image: const AssetImage('images/icon-scanner.png'),
  ),
  onPressed: () {
    // do something when the button is pressed
    debugPrint('Hi there');
  },
);
Widget title = Text('全球人壽 > 新版影像掃描', style: TextStyle(fontSize: 14));

IconButton uploadButon = IconButton(
  splashRadius: 24,
  iconSize: 24,
  icon: Ink.image(
    image: const AssetImage('images/icon-upload.png'),
  ),
  onPressed: () {
    // do something when the button is pressed
    //debugPrint('Hi there');
  },
);
Widget loginStatus = Container(
  margin: EdgeInsets.all(15),
  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: Colors.white,
    ),
    //borderRadius: BorderRadius.circular(10.0),
  ),
  child: Center(
    child: Text('未登入'),
  ),
);
IconButton loginButon = IconButton(
  icon: Icon(
    Icons.person,
    color: Colors.white,
  ),
  tooltip: '登入',
  onPressed: () => print('按下狗掌'),
);
IconButton modeButon = IconButton(
  icon: Icon(
    Icons.copy_rounded,
    color: Colors.white,
  ),
  tooltip: '執行模式',
  onPressed: () => print('按下狗掌'),
);

Widget env = Container(
  margin: EdgeInsets.fromLTRB(200, 15, 100, 15),
  padding: EdgeInsets.all(3),
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.white,
    ),
    //borderRadius: BorderRadius.circular(10.0),
  ),
  child: Center(
    child: Text('UPPRODUAT'),
  ),
);
AppBar appbar(BuildContext context) {
  return AppBar(
    leading: appIconButon,
    title: title,
    flexibleSpace: FlexibleSpaceBar(),
    actions: [
      uploadButon,
      loginStatus,
      loginButon,
      modeButon,
      env,
    ],
  );
}
