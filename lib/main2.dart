import 'package:flutter/material.dart';
import 'package:gesture/button.dart';
import 'package:gesture/startscreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() => runApp(MyApplimited());

class MyApplimited extends StatelessWidget {
  static final String title = 'Onboarding Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.red),
    home: OnBoardingPage(),
  );
}