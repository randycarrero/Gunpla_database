import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:gunpla_database/gunpla_details/gunpla_details_screen.dart';
import 'package:gunpla_database/home/gunpla_list_tile.dart';
import 'package:provider/provider.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('gunpla');

class Firestore {
  static String seriesUid;

  // ...
  static Stream<QuerySnapshot> readItems() {
    CollectionReference gunplaItemCollection =
        _mainCollection.doc(seriesUid).collection('mobile suit gundam');

    return gunplaItemCollection.snapshots();
  }
}
