import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';



// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.read<Backend>().signOut();
            },
            icon: const Icon(Icons.logout),
          ),
          title: const Text('Gunpla Database')),
      body: GunplaListTile(),
    );
  }
}

class GunplaListTile extends StatefulWidget {
  @override
  _GunplaListTileState createState() => _GunplaListTileState();
}

class _GunplaListTileState extends State<GunplaListTile> {
  Future getPost() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("gunpla").get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext content) {
    return Container(
      child: FutureBuilder(
          future: getPost(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading...."),
              );
            } else {
              ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].data["name"]),
                    );
                  });
            }
          }),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class GunplaDetailsScreen extends StatefulWidget {
  @override
  _GunplaDetailsScreenState createState() => _GunplaDetailsScreenState();
}

class _GunplaDetailsScreenState extends State<GunplaDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}//9:29

//      FutureBuilder(
//      future: context.read<Backend>().getGunplas(),
//      builder: (context, snapshot) {
//        if (snapshot.hasError) {
//         return const Center(
//          child: Text('An error occurred.'),
//       );
//    } else if (!snapshot.hasData) {
//     return const Center(
//      child: CircularProgressIndicator(),
//   );
//} else {
//           return ListView(
//          );
//       }
//    },
// ),
