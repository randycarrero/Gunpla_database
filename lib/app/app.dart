import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gunpla_database/app/theme.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:gunpla_database/home/home_screen.dart';
import 'package:gunpla_database/sign_up/sign_up_screen.dart';

class GunplaDatabaseApp extends StatelessWidget {
  const GunplaDatabaseApp({
    @required this.backend,
  }) : assert(backend != null);

  final Backend backend;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: Provider.value(
        value: backend,
        child: HomeScreen(),
      ),
    );
  }
}
