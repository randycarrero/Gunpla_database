import 'package:flutter/material.dart';
import 'package:gunpla_database/app/app.dart';
import 'package:gunpla_database/backend/backend.dart';

void main() {
  final backend = Backend('https://api.spacexdata.com/v4');

  runApp(
    GunplaDatabaseApp(
      backend: backend,
    ),
  );
}
