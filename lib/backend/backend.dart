import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

List<Gunpla> gunplaFromJson(String str) =>
    List<Gunpla>.from(json.decode(str).map((x) => Gunpla.fromJson(x)));

String gunplaToJson(List<Gunpla> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Backend {
  final String hostUrl;

  const Backend(this.hostUrl);

  Stream<User> get currentUserStream => FirebaseAuth.instance.userChanges();

  Stream<List<String>> get favoritedGunplas {
    final userId = FirebaseAuth.instance.currentUser.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((documentSnapshot) {
      if (!documentSnapshot.exists) {
        return [];
      }
      return documentSnapshot.data()['favorited_gunplas'] as List<String>;
    });
  }

  Future<List<Gunpla>> getGunplas() async {
    final url = '$hostUrl';

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw HttpException(
        '${response.statusCode}: ${response.reasonPhrase}',
        uri: Uri.tryParse(url),
      );
    }

    final body = response.body;

    final jsonData = json.decode(body) as List;

    final gunplas =
        jsonData.map((jsonObject) => Gunpla.fromJson(jsonObject)).toList();

    return gunplas;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signUp() async {
    await FirebaseAuth.instance.signInAnonymously();
  }
}

class Gunpla {
  int id;

  String image;
  String name;
  String series;
  String grade;
  String scale;
  String exclusive;
  Gunpla({
    this.id,
    this.image,
    this.name,
    this.series,
    this.grade,
    this.scale,
    this.exclusive,
  });

  factory Gunpla.fromJson(Map<String, dynamic> json) => Gunpla(
      id: json["id"],
      image: json["image"] == null ? null : json["image"],
      name: json["name"],
      series: json["series"],
      grade: json["grade"],
      scale: json["scale"],
      exclusive: json["exclusive"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image == null ? null : image,
        "name": name,
        "series": series,
        "grade": grade,
        "scale": scale,
        "exclusive": exclusive,
      };
}
