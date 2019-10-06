import 'package:ceb/ui/colors.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Us',
          style: TextStyle(color: primaryDark),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/avatar.jpg")))),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text(
                'I have worked on a multitude of web and print based projects for a range of clients providing Web Design (Photoshop, Illustrator, InDesign) and Development (PHP, HTML, CSS, LESS, JS, jQuery, WordPress, WooCommerce, Bootstrap, Responsive Layouts), eCommerce Solutions, Corporate Branding and Graphic Design. During my Multimedia degree I studied Information Architecture, and therefore have a keen understanding of wireframes, sitemaps and user experience design which I put to good use on every project I work on.',
                style: TextStyle(
                  color: primaryDark,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
