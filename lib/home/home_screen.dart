import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gunpla_database/authscreen/login_screen.dart';
import 'package:gunpla_database/backend/auth_provider.dart';
import 'package:gunpla_database/home/gunpla_list_page.dart';
import 'package:gunpla_database/pages/add_gunpla_screen.dart';

class HomeScreen extends StatelessWidget {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('gunpla');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              AuthClass().signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
            icon: const Icon(Icons.logout),
          ),
          title: const Text('Gunpla Database')),
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
}
