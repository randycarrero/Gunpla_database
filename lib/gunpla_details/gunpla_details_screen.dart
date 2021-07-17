import 'package:flutter/material.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gunpla_database/app/constants.dart';

class LeadingImage extends StatelessWidget {
  final String url;

  const LeadingImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Image.network(
        url,
        fit: BoxFit.contain,
        height: 350,
      ),
    );
  }
}

class GunplaDetailsScreen extends StatelessWidget {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('gunpla');

  GunplaDetailsScreen(this.document);

  final document;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
            ),
            // ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.edit),
          )
        ],
      ),
      body: ListView(
        children: [
          LeadingImage(
            document['image'],
          ),
          ListTile(
            title: Text(
              document['name'],
              style: textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              document['series'],
              style: textTheme.subtitle1,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.column_width),
            title: Text(document['scale']),
            subtitle: const Text('Available Scale(s)'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.colum_height),
            title: Text(document['grade']),
            subtitle: const Text('Available Grade'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star),
            title: Text(document['exclusive']),
            subtitle: const Text('Exclusive'),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 24),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {},
                    child: Text("Gunpla Built"),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
