import 'package:flutter/material.dart';
import 'package:gunpla_database/app/theme.dart';
import 'package:gunpla_database/home/home_screen.dart';

class GunplaDatabaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: HomeScreen(),
    );
  }
}
