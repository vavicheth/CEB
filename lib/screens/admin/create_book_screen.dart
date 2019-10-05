import 'dart:io';
import 'package:ceb/models/books_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:ceb/components/form_component.dart';
import 'package:ceb/ui/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateBookScreen extends StatefulWidget {
  @override
  _CreateBookScreenState createState() => _CreateBookScreenState();
}

class _CreateBookScreenState extends State<CreateBookScreen> {
  File _imageFile;
  String _urlDownload;

  Future getImage(bool camera) async {
    File image;
    if (camera == true) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _imageFile = image;
      print('Image file $_imageFile');
    });
  }

  Future uploadImage(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    return await taskSnapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create New Book',
          textAlign: TextAlign.center,
          style: TextStyle(color: primaryDark),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(context),
    );
  }

  var _titleCtrl = TextEditingController();
  var _descriptionCtrl = TextEditingController();
  var _authorCtrl = TextEditingController();
  var _yearCtrl = TextEditingController();
  var _sourceCtrl = TextEditingController();
  var _fileLocationCtrl = TextEditingController();
  var _viewerCtrl = TextEditingController();

  String photo;
  bool camera = true;

  _buildBody(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextBoxField(
              textCtrl: _titleCtrl,
              textHint: "Title",
              textInputType: TextInputType.text,
            ),
            TextBoxField(
              textCtrl: _descriptionCtrl,
              textHint: "Description",
              textInputType: TextInputType.text,
            ),
            TextBoxField(
              textCtrl: _authorCtrl,
              textHint: "Author",
              textInputType: TextInputType.text,
            ),
            TextBoxField(
              textCtrl: _yearCtrl,
              textHint: "Year",
              textInputType: TextInputType.number,
            ),
            TextBoxField(
              textCtrl: _sourceCtrl,
              textHint: "Source",
              textInputType: TextInputType.text,
            ),
            TextBoxField(
              textCtrl: _fileLocationCtrl,
              textHint: "File as PDF",
              textInputType: TextInputType.text,
            ),
            TextBoxField(
              textCtrl: _viewerCtrl,
              textHint: "User Role",
              textInputType: TextInputType.text,
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Row(
                children: <Widget>[
                  camera == false
                      ? IconButton(
                          icon: Icon(Icons.photo_size_select_actual),
                          onPressed: () {
                            setState(() {
                              camera = !camera;
                            });
                          })
                      : IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: () {
                            setState(() {
                              camera = !camera;
                            });
                          }),
                  RaisedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.file_upload),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Upload Book Cover Photo')
                        ],
                      ),
                      onPressed: () {
                        getImage(camera);
                      }),
                ],
              ),
            ),
            SizedBox(
              child: (_imageFile != null)
                  ? Container(
                      height: 200,
                      child: Image.file(
                        _imageFile,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(),
            ),
            Container(
              height: 60.0,
              padding: EdgeInsets.all(10),
              child: InkWell(
                child: Material(
                  elevation: 5.0,
                  color: primaryDark,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  uploadImage(context).then((value) {
                    Photo cover = Photo(cover: value, content: '');
                    List<Viewer> c = [];
                    c.add(Viewer(role: _viewerCtrl.text, other: ''));
                    Firestore.instance.runTransaction((tran) async {
                      var ref = Firestore.instance.collection("books");
                      Books books = Books(
                          title: _titleCtrl.text,
                          author: _authorCtrl.text,
                          description: _descriptionCtrl.text,
                          fileLocation: _fileLocationCtrl.text,
                          source: _sourceCtrl.text,
                          year: _yearCtrl.text,
                          photo: cover,
                          viewers: c);
                      await ref.add(books.toMap());
                    }).whenComplete(() {
                      print('Book has been save!');
                      Navigator.pop(context);
                    });
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
