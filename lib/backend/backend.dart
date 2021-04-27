import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<User> get currentUserStream => FirebaseAuth.instance.userChanges();
Future<void> signUp() async {
  await FirebaseAuth.instance.signInAnonymously();
}

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

class Backend {
  const Backend(this.hostUrl);

  final String hostUrl;

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
}

List<Gunpla> gunplaFromJson(String str) =>
    List<Gunpla>.from(json.decode(str).map((x) => Gunpla.fromJson(x)));

String gunplaToJson(List<Gunpla> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gunpla {
  Gunpla({
    this.id,
    this.image,
    this.name,
    this.series,
    this.grade,
    this.scale,
    this.exclusive,
  });

  int id;
  String image;
  String name;
  String series;
  String grade;
  String scale;
  String exclusive;

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
