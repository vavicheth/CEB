import 'package:ceb/helpers/auth_email_helper.dart';
import 'package:ceb/helpers/auth_phonenumber_helper.dart';
import 'package:ceb/screens/login_screen.dart';
import 'package:ceb/screens/verify_phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../ui/colors.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  var _emailCtrl = TextEditingController();
  var _passwordCtrl = TextEditingController();
  var _phoneNumber = TextEditingController();
  var _verifyCode = TextEditingController();

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
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text(
                'Or Phone Number',
                style: TextStyle(color: secondaryColor),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: secondaryWhite),
                  controller: _phoneNumber,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(color: secondaryColor),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0)),
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: Colors.white,
                    ),
                  ),
                  obscureText: false,
                ),
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
                        'Send Verify Code',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  sendVerificationCode(_phoneNumber.text);
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: VerifyPhoneScreen(
                        phonenum: _phoneNumber.text,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
