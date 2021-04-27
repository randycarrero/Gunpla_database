// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:gunpla_database/home/gunpla_list_tile.dart';
import 'package:gunpla_database/gunpla_details/gunpla_details_screen.dart';
import 'package:gunpla_database/pages/profile.dart';
import 'package:gunpla_database/pages/series.dart';
import 'package:gunpla_database/pages/settings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTAb = 0;
  final List<Widget> screens = [HomeScreen(), Series(), Profile(), Setting()];
  List gunplas = [];
  List filteredgunplas = [];
  bool isSearching = false;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text('Gunpla Database')
            : TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search Gunpla Here",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<Backend>().getGunplas(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred.'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final gunplas = snapshot.data;

            return ListView(
              children: [
                for (final gunpla in gunplas) ...[
                  GunplaListTile(
                    gunpla: gunpla,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return GunplaDetailsScreen(gunpla: gunpla);
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(height: 0.0),
                ]
              ],
            );
          }
        },
      ),
    );
  }
}
