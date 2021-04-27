import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gunpla_database/app/theme.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:gunpla_database/home/home_screen.dart';
import 'package:gunpla_database/sign_up/sign_up_screen.dart';
import 'package:provider/provider.dart';

class GunplaDatabaseApp extends StatelessWidget {
  final Backend backend;

  const GunplaDatabaseApp({
    @required this.backend,
  }) : assert(backend != null);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: backend,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: StreamBuilder<User>(
            stream: backend.currentUserStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SignUpScreen();
              }
              return HomeScreen();
            }),
      ),
    );
  }
}
