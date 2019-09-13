import 'package:ceb/components/drawer_component.dart';
import 'package:ceb/screens/pdfview_screen.dart';
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
    );
  }

  _buildDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.pink]),
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
              color: Colors.white,
              leadIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                print('Clicked home!');
              },
            ),
            DrawerListTile(
              title: 'Book Management',
              color: Colors.white,
              leadIcon: Icon(
                Icons.book,
                color: Colors.white,
              ),
              onPressed: () {
                print('Clicked Book!');
              },
            ),
            DrawerListTile(
              title: 'Users Management',
              color: Colors.white,
              leadIcon: Icon(
                Icons.supervisor_account,
                color: Colors.white,
              ),
              onPressed: () {
                print('Clicked user!');
              },
            ),
            DrawerListTile(
              title: 'About Us',
              color: Colors.white,
              leadIcon: Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                print('Clicked about!');
              },
            ),
            DrawerListTile(
              title: 'Contact Us',
              color: Colors.white,
              leadIcon: Icon(
                Icons.phone_android,
                color: Colors.white,
              ),
              onPressed: () {
                print('Clicked Contact!');
              },
            ),
            DrawerListTile(
              title: 'Logout',
              color: Colors.white,
              leadIcon: Icon(
                Icons.power_settings_new,
                color: Colors.white,
              ),
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
      actions: <Widget>[
        IconButton(icon: Icon(Icons.notifications,color: Colors.white,), onPressed: null)
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
          Card(
            color: Colors.lightBlueAccent,
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: PDFView()),
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
                    Text('This is sample of E-book App',style: TextStyle(fontSize: 20.0,color: Colors.white),),

                  ],
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
                  Text('This is sample of E-book App',style: TextStyle(fontSize: 20.0,color: Colors.white),),

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
                  Text('This is sample of E-book App',style: TextStyle(fontSize: 20.0,color: Colors.white),),

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
                  Text('This is sample of E-book App',style: TextStyle(fontSize: 20.0,color: Colors.white),),

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
                  Text('This is sample of E-book App',style: TextStyle(fontSize: 20.0,color: Colors.white),),

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
                  Text('This is sample of E-book App',style: TextStyle(fontSize: 20.0,color: Colors.white),),

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
                  Text('This is sample of E-book App',style: TextStyle(fontSize: 20.0,color: Colors.white),),

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
                  Text('This is sample of E-book App',style: TextStyle(fontSize: 20.0,color: Colors.white),),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
