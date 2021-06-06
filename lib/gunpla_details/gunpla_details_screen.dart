import 'package:flutter/material.dart';
import 'package:ant_icons/ant_icons.dart';
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
      child: Image.network(
        url,
        fit: BoxFit.contain,
        height: 300,
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
      appBar: AppBar(title: Text("Gunpla Detail")),
      body: ListView(
        children: [
          LeadingImage(
            document['image'],
          ),
          ListTile(
            title: Text(
              document['name'],
              // "gunpla.name",
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
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 56.0,
            ),
          ),
        ],
      ),
    );
  }
}

// class GunplaDetailsScreen extends StatelessWidget {
//   final Gunpla gunpla;

//   const GunplaDetailsScreen({
//     Key key,
//     @required this.gunpla,
//   })  : assert(gunpla != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(gunpla.name),
//         actions: [
//           StreamBuilder<List<String>>(
//               stream: context.read<Backend>().favoritedGunplas,
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 final favoritedGunplas = snapshot.data;
//                 final isGunplasFavorited =
//                     favoritedGunplas.contains('${gunpla.id}');
//                 return IconButton(
//                   onPressed: () {
//                     context.read<Backend>().setFavoritedGunpla(
//                           id: '${gunpla.id}',
//                           favorited: !isGunplasFavorited,
//                         );
//                   },
//                   icon: isGunplasFavorited
//                       ? const Icon(
//                           AntIcons.heart,
//                           color: Colors.redAccent,
//                         )
//                       : const Icon(AntIcons.heart_outline),
//                 );
//               }),
//         ],
//       ),
