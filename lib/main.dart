import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gunpla_database/app/app.dart';
import 'package:gunpla_database/backend/backend.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final backend = Backend('XXXXX://XXX.XXXXXXXXXXXXXXXXX/XXXXX.XXXX');

  runApp(
    GunplaDatabaseApp(
      backend: backend,
    ),
  );
}
