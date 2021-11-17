import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_date_app/const/color.dart';
import 'package:guess_date_app/screen/main_screen.dart';
import 'package:guess_date_app/screen/opening_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: OpeningScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

