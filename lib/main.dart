import 'package:ceb/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(CEBApp());

class CEBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: WelcomeScreen(),
    );
  }
}
