// import 'dart:convert';
// import 'dart:io';
// import 'package:meta/meta.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';


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
