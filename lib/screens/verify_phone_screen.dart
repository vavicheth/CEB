import 'package:ceb/helpers/auth_phonenumber_helper.dart';
import 'package:ceb/helpers/storage_helper.dart';
import 'package:ceb/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../ui/colors.dart';

class VerifyPhoneScreen extends StatefulWidget {
  final String phonenum;
  VerifyPhoneScreen({this.phonenum});

  @override
  _VerifyPhoneScreenState createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

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
                  controller: _verifyCode,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    hintText: 'Code Verfication',
                    hintStyle: TextStyle(color: secondaryColor),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 1.0)),
                    prefixIcon: const Icon(
                      Icons.phone_iphone,
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
                        'Confirm',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  verifyCode(_verifyCode.text).then((verified) {
                    if (verified) {
                      writeStorage('phonenum', widget.phonenum);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    } else {
                      print("login failed with phone number");
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
