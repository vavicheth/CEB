import 'dart:async';

import 'package:ceb/screens/home_screen.dart';
import 'package:ceb/screens/login_screen.dart';
import 'package:ceb/ui/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Future<void> _loading;
  Future<void> _loadingData() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    if (user != null) {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(seconds: 1),
            child: HomeScreen(
              user: user,
            ),
          ),
        );
      });
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(seconds: 1),
            child: LoginScreen(),
          ),
        );
      });
    }
  }

  void initState() {
    super.initState();
    _loading = _loadingData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox();
        } else {
          return Container(
            color: primaryDark,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  elevation: 10.0,
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/images/logo_ch.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  child: SpinKitRing(
                    color: Colors.white,
                    size: 50.0,
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
