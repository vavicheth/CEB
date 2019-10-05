import 'package:ceb/helpers/auth_email_helper.dart';
import 'package:ceb/helpers/auth_google_helper.dart';
import 'package:ceb/screens/home_screen.dart';
import 'package:ceb/screens/register_screen.dart';
import 'package:ceb/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  var _emailCtrl = TextEditingController();
  var _passwordCtrl = TextEditingController();

  _buildBody() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: primaryGradient,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 150.0,
              padding: EdgeInsets.all(20.0),
              child: Image.asset('assets/images/logo_ch.png'),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: secondaryWhite),
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(color: secondaryColor),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0)),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                  obscureText: false,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: secondaryWhite),
                  controller: _passwordCtrl,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    //Add th Hint text here.
                    hintStyle: TextStyle(color: secondaryColor),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0)),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
//            SizedBox(
//              height: 40.0,
//            ),
            Container(
              height: 60.0,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: InkWell(
                child: Material(
                  elevation: 5.0,
                  color: primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign in with Email',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  loginByEmail(_emailCtrl.text, _passwordCtrl.text)
                      .then((user) {
//                    saveDataToLocal('useremail', _emailCtrl.text);
//                    saveDataToLocal('pwd', _passwordCtrl.text);
//
//                    writeStorage('userstorage', _emailCtrl.text);
//                    writeStorage('pwdstorage', _passwordCtrl.text);

                    print('userID: ${user.uid} and email: ${user.email}');
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: HomeScreen(),
                      ),
                    );
                  });
                },
              ),
            ),
            Container(
              height: 60.0,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: InkWell(
                child: Material(
                  elevation: 5.0,
                  color: primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: RegisterScreen()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text(
                'Or',
                style: TextStyle(color: secondaryColor),
              ),
            ),
            Container(
              height: 60.0,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: InkWell(
                child: Material(
                  elevation: 5.0,
                  color: Color(0xFFB03323),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/gmail_logo.png',
                        height: 30,
                      ),
                      Text(
                        'Sign in with Gmail',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  googleSignIn().then((user) {
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: HomeScreen(),
                        ),
                      );
                    } else {
                      print('Login faild');
                    }
                  });
                },
              ),
            ),
            Container(
              height: 60.0,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: InkWell(
                child: Material(
                  elevation: 5.0,
                  color: Color(0xFF2D67A5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/fb_logo.png',
                        height: 30,
                      ),
                      Text(
                        'Sign in with Facebook',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  //TODO: signin
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
