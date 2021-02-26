import 'package:flutter/material.dart';
import 'package:gunpla_database/home/home_screen.dart';
import 'package:gunpla_database/app/theme.dart';

class GunplaDatabaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
    );
  }
}