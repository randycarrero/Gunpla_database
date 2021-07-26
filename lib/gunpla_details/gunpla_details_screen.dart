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

class GunplaDetailsScreen extends StatefulWidget {
  GunplaDetailsScreen(this.document);

  final document;

  @override
  _GunplaDetailsScreenState createState() => _GunplaDetailsScreenState();
}

class _GunplaDetailsScreenState extends State<GunplaDetailsScreen> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('gunpla');
  Color _iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      _iconColor = Colors.redAccent;
                    });
                  },
                  icon: Icon(Icons.favorite, color: _iconColor),
                  // ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.edit),
                );
              })
        ],
      ),
      body: ListView(
        children: [
          LeadingImage(
            widget.document['image'],
          ),
          ListTile(
            title: Text(
              widget.document['name'],
              style: textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.document['series'],
              style: textTheme.subtitle1,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.column_width),
            title: Text(widget.document['scale']),
            subtitle: const Text('Available Scale(s)'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.colum_height),
            title: Text(widget.document['grade']),
            subtitle: const Text('Available Grade'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star),
            title: Text(widget.document['exclusive']),
            subtitle: const Text('Exclusive'),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton.extended(
              backgroundColor: const Color(0xffffBF00),
              foregroundColor: Colors.black,
              onPressed: () {
                // Respond to button press
              },
              icon: Icon(Icons.add),
              label: Text('Gunpla Built'),
            ),
          ),
        ],
      ),
    );
  }
}
