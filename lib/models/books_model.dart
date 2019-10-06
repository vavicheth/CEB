import 'package:cloud_firestore/cloud_firestore.dart';

class Books {
  String title;
  String description;
  String author;
  String year;
  String source;
  String fileLocation;
  DocumentReference reference;
  Photo photo;
  List<Viewer> viewers;

  Books(
      {this.title,
      this.description,
      this.author,
      this.year,
      this.source,
      this.fileLocation,
      this.photo,
      this.viewers,
      this.reference});

  Books.fromMap(Map map, {this.reference}) {
    title = map["title"] ?? "no data";
    description = map["description"] ?? "no data";
    author = map["author"] ?? "no data";
    year = map["year"] ?? "no data";
    source = map["source"] ?? "no data";
    fileLocation = map["fileLocation"] ??
        "https://firebasestorage.googleapis.com/v0/b/calmette-ceb-e9ee3.appspot.com/o/ppt%20Flutter%20and%20Dart%203.pdf?alt=media&token=83863d21-b64e-4305-9456-c4cd7efa2670";
    photo = Photo.fromMap(map["photos"]);
    viewers = List<Viewer>.from(map["viewers"].map((x) => Viewer.fromMap(x)));
  }

  factory Books.fromSnapshot(DocumentSnapshot snapshot) {
    return Books.fromMap(snapshot.data, reference: snapshot.reference);
  }

  Map<String, dynamic> toMap() => {
        "title": title ?? "nodata",
        "description": description ?? "nodata",
        "author": author ?? "nodata",
        "year": year ?? "nodata",
        "source": source ?? "nodata",
        "fileLocation": fileLocation ??
            "https://firebasestorage.googleapis.com/v0/b/calmette-ceb-e9ee3.appspot.com/o/ppt%20Flutter%20and%20Dart%203.pdf?alt=media&token=83863d21-b64e-4305-9456-c4cd7efa2670",
        "photos": photo.toMap(),
        "viewers": List<dynamic>.from(viewers.map((x) => x.toMap())),
      };
}

class Photo {
  String cover, content;

  Photo({this.cover, this.content});

  factory Photo.fromMap(Map map) {
    return Photo(
      cover: map['cover'] ?? "no cover",
      content: map['content'] ?? "no content",
    );
  }

  Map<String, dynamic> toMap() => {
        "cover": cover ?? "no cover",
        "content": content ?? "no content",
      };
}

class Viewer {
  String role;
  String other;
  Viewer({this.role = "no role", this.other = "no other"});

  factory Viewer.fromMap(Map map) {
    return Viewer(
      role: map['role'] ?? "no role",
      other: map['other'] ?? "no other",
    );
  }

  Map<String, dynamic> toMap() => {
        "role": role ?? "no role",
        "other": other ?? "no other",
      };
}
