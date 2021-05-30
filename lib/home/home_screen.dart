import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LeadingImage extends StatelessWidget {
  final String url;

  const LeadingImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Image.network(url),
      ),
    );
  }
}

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
      body: SingleChildScrollView(
          child: StreamBuilder(
        stream: collectionReference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var docs = snapshot.data.docs;
            return ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: docs.length,
                itemBuilder: (_, index) {
                  var document = docs[index];
                  return ListTile(
                    isThreeLine: true,
                    leading: LeadingImage(document['image']),
                    title: Text(document['name']),
                    subtitle: Text(
                      document['series'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.chevron_right_sharp),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}
