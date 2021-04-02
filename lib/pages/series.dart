import 'package:flutter/material.dart';

class Series extends StatefulWidget {
  @override
  _SeriesState createState() => _SeriesState();
}

class _SeriesState extends State<Series> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Series')),
      body:
          Center(child: Text('Series Screen', style: TextStyle(fontSize: 40))),
    );
  }
}
