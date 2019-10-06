import 'package:ceb/models/books_model.dart';
import 'package:ceb/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PDFView extends StatefulWidget {
  final Books books;
  PDFView({this.books});

  @override
  _PDFViewState createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    String file = widget.books.fileLocation;
    String tfile = (file.replaceAll(new RegExp(r"\s+\b|\b\s"), ""));
    if (tfile != '' || tfile != null) {
      document = await PDFDocument.fromURL(widget.books.fileLocation);
    } else {
      document = await PDFDocument.fromAsset('assets/sample.pdf');
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.books.title != null ? widget.books.title : 'PDF View',
          style: TextStyle(color: primaryDark),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(document: document));
  }
}
