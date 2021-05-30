// import 'dart:convert';
// import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:gunpla_database/pages/splash.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Splash();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

// import 'package:meta/meta.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:http/http.dart' as http;

// List<Gunpla> gunplaFromJson(String str) =>
//     List<Gunpla>.from(json.decode(str).map((x) => Gunpla.fromJson(x)));

// String gunplaToJson(List<Gunpla> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Backend {
//   final String hostUrl;

//   const Backend(this.hostUrl);

//   Stream<User> get currentUserStream => FirebaseAuth.instance.userChanges();

//   Stream<List<String>> get favoritedGunplas {
//     final userId = FirebaseAuth.instance.currentUser.uid;
//     return FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .snapshots()
//         .map((documentSnapshot) {
//       if (!documentSnapshot.exists) {
//         return [];
//       }
//       return List<String>.from(documentSnapshot.data()['favorited_gunplas']);
//     });
//   }

//   Future<void> setFavoritedGunpla({
//     @required String id,
//     @required bool favorited,
//   }) async {
//     final currentFavoritedGunplas = await favoritedGunplas.first;

//     if (favorited && !currentFavoritedGunplas.contains(id)) {
//       currentFavoritedGunplas.add(id);
//     } else if (!favorited && currentFavoritedGunplas.contains(id)) {
//       currentFavoritedGunplas.remove(id);
//     }
//     final userId = FirebaseAuth.instance.currentUser.uid;
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .set({'favorited_gunplas': currentFavoritedGunplas});
//   }

//   Future<List<Gunpla>> getGunplas() async {
//     final url = '$hostUrl';

//     final response = await http.get(url);

//     if (response.statusCode != 200) {
//       throw HttpException(
//         '${response.statusCode}: ${response.reasonPhrase}',
//         uri: Uri.tryParse(url),
//       );
//     }

//     final body = response.body;

//     final jsonData = json.decode(body) as List;

//     final gunplas =
//         jsonData.map((jsonObject) => Gunpla.fromJson(jsonObject)).toList();

//     return gunplas;
//   }

//   Future<void> signOut() async {
//     await FirebaseAuth.instance.signOut();
//   }

//   Future<void> signUp() async {
//     await FirebaseAuth.instance.signInAnonymously();
//   }
// }

// class Gunpla {
//   int id;

//   String image;
//   String name;
//   String series;
//   String grade;
//   String scale;
//   String exclusive;
//   Gunpla({
//     this.id,
//     this.image,
//     this.name,
//     this.series,
//     this.grade,
//     this.scale,
//     this.exclusive,
//   });

//   factory Gunpla.fromJson(Map<String, dynamic> json) => Gunpla(
//       id: json["id"],
//       image: json["image"] == null ? null : json["image"],
//       name: json["name"],
//       series: json["series"],
//       grade: json["grade"],
//       scale: json["scale"],
//       exclusive: json["exclusive"]);

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image == null ? null : image,
//         "name": name,
//         "series": series,
//         "grade": grade,
//         "scale": scale,
//         "exclusive": exclusive,
//       };
// }
