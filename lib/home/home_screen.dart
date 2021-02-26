import 'package:flutter/material.dart';
import 'package:gunpla_database/home/gunpla_list_tile.dart';
import 'package:gunpla_database/backend/backend.dart';

const _gunpla = Gunpla(name: "Falcon Heavy", description: "Hello World");

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gunplda Database'),
      ),
      body: ListView(
        children: [
          GunplaListTile(
            onTap: () {},
            gunpla: _gunpla,
          ),
        ],
      ),
    );
  }
}
