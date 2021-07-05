import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite')),
      body: Center(
          child: Text('Favorite Screen', style: TextStyle(fontSize: 40))),
    );
  }
}
