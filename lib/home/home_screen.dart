import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gunpla_database/authscreen/login_screen.dart';
import 'package:gunpla_database/backend/auth_provider.dart';
import 'package:gunpla_database/home/gunpla_list_page.dart';
import 'package:gunpla_database/pages/add_gunpla_screen.dart';
import 'package:gunpla_database/pages/profile.dart';
import 'package:gunpla_database/pages/settings.dart';
import 'package:gunpla_database/app/constants.dart';
import 'package:gunpla_database/data/menu_items.dart';

class HomeScreen extends StatelessWidget {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('gunpla');
  
    PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        child: Row(
          children: [
            Icon(
              item.icon,
              color: Colors.black,
              size: 20,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(item.text),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {
          //     AuthClass().signOut();
          //     Navigator.pushAndRemoveUntil(
          //         context,
          //         MaterialPageRoute(builder: (context) => LoginScreen()),
          //         (route) => false);
          //   },
          //   icon: const Icon(Icons.logout),
          // ),
          title: const Text('Gunpla Database'),
                actions: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.search),
            // ),
            PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                ...MenuItems.itemsFirst.map(buildItem).toList(),
                PopupMenuDivider(),
                ...MenuItems.itemsSecond.map(buildItem).toList(),
              ],
            ),
          ]
      ),
      body: GunplaListTile(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddGunplaScreen()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
    void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemProfile:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Profile()),
        );
        break;
      case MenuItems.itemSettings:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Setting()),
        );
        break;
      case MenuItems.itemSignout:
        AuthClass().signOut();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
    }
  }
}
