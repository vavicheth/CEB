import 'package:ceb/screens/login_screen.dart';
import 'package:ceb/screens/welcome_screen.dart';
import 'package:ceb/ui/colors.dart';
import 'package:ceb/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//void main() => runApp(CEBApp());
void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryDark));
  runApp(CEBApp());
}

class CEBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildThemeData(),
      home: LoginScreen(),
    );
  }
}
