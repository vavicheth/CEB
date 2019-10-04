import 'package:flutter/material.dart';

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
                  //TODO: signin
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
