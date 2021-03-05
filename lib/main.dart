import 'package:flutter/material.dart';
import 'package:gunpla_database/app/app.dart';
import 'package:gunpla_database/backend/backend.dart';

void main() {
  final backend = Backend(
      'https://raw.githubusercontent.com/randycarrero/GunplaDatasite/main/data/model.json');

  runApp(
    GunplaDatabaseApp(
      backend: backend,
    ),
  );
}
