import 'package:ceb/models/books_model.dart';
import 'package:ceb/screens/admin/create_book_screen.dart';
import 'package:ceb/ui/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';

import '../pdfview_screen.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'List Book',
        style: TextStyle(color: primaryDark),
      ),
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.note_add,
              color: primaryDark,
              size: 28,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: CreateBookScreen(),
                ),
              );
            })
      ],
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
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Edit',
            color: Colors.blue,
            icon: Icons.edit,
            onTap: () {},
          ),
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              Firestore.instance.runTransaction((tran) async {
                await tran.delete(bookAtIndex.reference);
                print(
                    "newsAtIndex.reference.documentID ${bookAtIndex.reference.documentID} deleted");
              });
            },
          ),
        ],
      ),
    );
  }
}
