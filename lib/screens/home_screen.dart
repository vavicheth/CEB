import 'package:ceb/components/drawer_component.dart';
import 'package:flutter/material.dart';
import 'package:loader_search_bar/loader_search_bar.dart';

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
    return SearchBar(
      defaultBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _buildDrawer,
        ),
        title: Text('Default app bar title'),
      ),
    );
  }
}
