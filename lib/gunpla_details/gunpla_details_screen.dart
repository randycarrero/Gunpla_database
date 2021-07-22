import 'package:flutter/material.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gunpla_database/app/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  double _rating;

  @override
  void initState() {
    super.initState();
    _rating = 0;
  }

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
          // RatingBar.builder()
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: RatingBar.builder(
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber[700],
                    ),
                    onRatingUpdate: (double rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                  ),
                ),
                Text('Rating: $_rating',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
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
