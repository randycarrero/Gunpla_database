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
                                    leading:
                                        // CircleAvatar(
                                        //   backgroundImage:
                                        //       NetworkImage(userAvatarUrl),
                                        // ),
                                        //   CircleAvatar(
                                        // backgroundColor: Colors.brown.shade800,
                                        // child: const Text('AH'),
                                        Material(
                                      clipBehavior: Clip.antiAlias,
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: AspectRatio(
                                          aspectRatio: 3 / 2,
                                          child: Image.network(
                                              snapshot.data.documents[index]
                                                  .data["url"],
                                              fit: BoxFit.cover)),
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
                                const Divider(height: 0.0),
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
