import 'package:ceb/ui/colors.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: TextStyle(color: primaryDark),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.language,
                color: primaryDark,
              ),
              title: Text(
                "wwww.searchme.com",
                style: TextStyle(color: primaryDark),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.mail_outline,
                color: primaryDark,
              ),
              title: Text(
                "info@searchme.com",
                style: TextStyle(color: primaryDark),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: primaryDark,
              ),
              title: Text(
                "(855) 23 444 555",
                style: TextStyle(color: primaryDark),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.phone_android,
                color: primaryDark,
              ),
              title: Text(
                "(855) 12 222 333",
                style: TextStyle(color: primaryDark),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.chat_bubble_outline,
                color: primaryDark,
              ),
              title: Text(
                "www.facebook.com/searchme",
                style: TextStyle(color: primaryDark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
