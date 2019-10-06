import 'package:ceb/components/drawer_component.dart';
import 'package:ceb/helpers/storage_helper.dart';
import 'package:ceb/models/books_model.dart';
import 'package:ceb/screens/about_screen.dart';
import 'package:ceb/screens/admin/booklist_screen.dart';
import 'package:ceb/screens/contactus_screen.dart';
import 'package:ceb/screens/login_screen.dart';
import 'package:ceb/screens/pdfview_screen.dart';
import 'package:ceb/ui/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loader_search_bar/loader_search_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ceb/helpers/auth_google_helper.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseUser user;
  HomeScreen({this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _buildEndDrawer(context),
      drawer: _buildDrawer(context),
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  _buildDrawer(context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: primaryGradient,
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
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: BookListScreen(),
                  ),
                );
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
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: AboutScreen(),
                  ),
                );
              },
            ),
            DrawerListTile(
              title: 'Contact Us',
              leadIcon: Icons.phone_android,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: ContactUsScreen(),
                  ),
                );
              },
            ),
            DrawerListTile(
              title: 'Logout',
              leadIcon: Icons.power_settings_new,
              onPressed: () async {
                if (await _googleSignIn.isSignedIn()) {
                  _googleSignIn.signOut();
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: LoginScreen(),
                    ),
                  );
                } else {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: LoginScreen(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildEndDrawer(context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: primaryGradient,
        ),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/avatar.jpg")))),
                  Text(
                    'VA VICHETH',
                    style: TextStyle(color: secondaryWhite, fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              height: 150.0,
              margin: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('First Name: VA',
                      style: TextStyle(color: Colors.yellow)),
                  Text('Last Name: Vicheth',
                      style: TextStyle(color: Colors.yellow)),
                  Text('Gender: Male', style: TextStyle(color: Colors.yellow)),
                  Text('Date of Birth: 01/01/1990',
                      style: TextStyle(color: Colors.yellow)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'E-Book System',
        style: TextStyle(color: primaryDark),
      ),
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
  }

  int currentPage = 0;

  _buildNavigationBar() {
    return FancyBottomNavigation(
      tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: Icons.favorite, title: "Favorite"),
        TabData(iconData: Icons.account_box, title: "My Account")
      ],
      onTabChangedListener: (position) {
        setState(() {
          currentPage = position;
        });

        if (currentPage == 0) {
          print('home');
        } else if (currentPage == 1) {
          print('favorite');
        } else if (currentPage == 2) {
          _scaffoldKey.currentState.openEndDrawer();
        }
      },
    );
  }

  _buildBody() {
    return Container(
      child: _buildFirestore(),
    );
  }

  _buildFirestore() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 5.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('books').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return _buildListView(snapshot.data.documents);
          }
        },
      ),
    );
  }

  _buildListView(List<DocumentSnapshot> documents) {
    return Container(
      child: ListView.builder(
          itemCount: documents.length,
          itemBuilder: (_, index) {
            Books books = Books.fromSnapshot(documents[index]);
            return _buildListViewItem(books);
          }),
    );
  }

  _buildListViewItem(Books bookAtIndex) {
    return Container(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Material(
            elevation: 5.0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: PDFView(
                        books: bookAtIndex,
                      )),
                );
              },
              child: Container(
                padding: EdgeInsets.all(5.0),
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 70.0,
                      height: 100.0,
                      child: Image.network(bookAtIndex.photo.cover),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          bookAtIndex.title,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: primaryDark,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bookAtIndex.description,
                          style:
                              TextStyle(fontSize: 13.0, color: secondaryDark),
                        ),
                        Text(
                          bookAtIndex.author,
                          style: TextStyle(
                              fontSize: 13.0,
                              color: secondaryDark,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
//        secondaryActions: <Widget>[
//          IconSlideAction(
//            caption: 'Edit',
//            color: Colors.blue,
//            icon: Icons.edit,
//            onTap: () {},
//          ),
//          IconSlideAction(
//            caption: 'Delete',
//            color: Colors.red,
//            icon: Icons.delete,
//            onTap: () {
//              Firestore.instance.runTransaction((tran) async {
//                await tran.delete(bookAtIndex.reference);
//                print(
//                    "newsAtIndex.reference.documentID ${bookAtIndex.reference.documentID} deleted");
//              });
//            },
//          ),
//        ],
      ),
    );
  }
}
