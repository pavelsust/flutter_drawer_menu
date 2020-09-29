import 'package:flutter/material.dart';
import 'package:flutter_drawer_menu/test/lib/TutorialScreen.dart';
import 'package:flutter_drawer_menu/test/lib/bottombar/MyHomePage.dart';
import 'package:flutter_drawer_menu/test/lib/pages/drawer_menu.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'NavigationDrawer Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TutorialScreen());
  }
}
