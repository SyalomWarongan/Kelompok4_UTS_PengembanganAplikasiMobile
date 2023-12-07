import 'package:dailydosenews_uts/Home.dart';
import 'package:dailydosenews_uts/splashscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Splash(),
        '/Home': (context) => Home(),
      },
      // debugShowCheckedModeBanner: false,
      // title: 'Daily Dose of News',
      // theme: ThemeData(appBarTheme: AppBarTheme(elevation: 0)),
      // home: Home(),
    );
  }
}
