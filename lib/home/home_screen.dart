import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('gunpla');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
          title: const Text('Gunpla Database')),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
              stream: collectionReference.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data.docs
                        .map((e) => Column(
                              children: [
                                ListTile(
                                    isThreeLine: true,
                                    leading: GestureDetector(
                                      //  onTap: () {},
                                      child: FlutterLogo(),
                                    ),
                                    title: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: Text(e['name']),
                                          )
                                        ]),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                          e['series'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Divider(
                                  color: Colors.black.withOpacity(0.6),
                                  thickness: 2,
                                )
                              ],
                            ))
                        .toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
