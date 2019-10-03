import 'package:ceb/components/drawer_component.dart';
import 'package:ceb/screens/pdfview_screen.dart';
import 'package:ceb/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:loader_search_bar/loader_search_bar.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  _buildDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: primaryGradient,
//          image: DecorationImage(
//              image: AssetImage("assets/images/bg_drawer.png"),
//              fit: BoxFit.cover),
        ),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Image.asset("assets/images/logo_ch.png"),
              ),
            ),
            DrawerListTile(
              title: 'Home',
              leadIcon: Icons.home,
              onPressed: () {
                print('Clicked home!');
              },
            ),
            DrawerListTile(
              title: 'Book Management',
              leadIcon: Icons.book,
              onPressed: () {
                print('Clicked Book!');
              },
            ),
            DrawerListTile(
              title: 'Users Management',
              leadIcon: Icons.supervisor_account,
              onPressed: () {
                print('Clicked user!');
              },
            ),
            DrawerListTile(
              title: 'About Us',
              leadIcon: Icons.info,
              onPressed: () {
                print('Clicked about!');
              },
            ),
            DrawerListTile(
              title: 'Contact Us',
              leadIcon: Icons.phone_android,
              onPressed: () {
                print('Clicked Contact!');
              },
            ),
            DrawerListTile(
              title: 'Logout',
              leadIcon: Icons.power_settings_new,
              onPressed: () {
                print('Clicked Contact!');
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: secondaryWhite,
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.notifications,
              size: 32.0,
              color: primaryDark,
            ),
            onPressed: null)
      ],
    );
//    return SearchBar(
//      defaultBar: AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.menu),
//          onPressed: _buildDrawer,
//        ),
//        title: Text('Default app bar title'),
//      ),
//    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Material(
              elevation: 5.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft, child: PDFView()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 100.0,
                        child: Image.asset('assets/images/bg_drawer.png'),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'This is sample of E-book App',
                        style: TextStyle(fontSize: 20.0, color: secondaryDark),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.lightBlueAccent,
            child: Container(
              padding: EdgeInsets.all(5.0),
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset('assets/images/bg_drawer.png'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'This is sample of E-book App',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.lightBlueAccent,
            child: Container(
              padding: EdgeInsets.all(5.0),
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset('assets/images/bg_drawer.png'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'This is sample of E-book App',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.lightBlueAccent,
            child: Container(
              padding: EdgeInsets.all(5.0),
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset('assets/images/bg_drawer.png'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'This is sample of E-book App',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.lightBlueAccent,
            child: Container(
              padding: EdgeInsets.all(5.0),
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset('assets/images/bg_drawer.png'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'This is sample of E-book App',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.lightBlueAccent,
            child: Container(
              padding: EdgeInsets.all(5.0),
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset('assets/images/bg_drawer.png'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'This is sample of E-book App',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.lightBlueAccent,
            child: Container(
              padding: EdgeInsets.all(5.0),
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset('assets/images/bg_drawer.png'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'This is sample of E-book App',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.lightBlueAccent,
            child: Container(
              padding: EdgeInsets.all(5.0),
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset('assets/images/bg_drawer.png'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'This is sample of E-book App',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildNavigationBar() {
    return BottomAppBar(
//      color: primaryDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.home,
                color: primaryDark,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.account_box,
                color: primaryDark,
              ),
              onPressed: null),
        ],
      ),
    );
  }
}
