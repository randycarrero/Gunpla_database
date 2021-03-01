import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';

import '../backend/backend.dart';
import '../backend/backend.dart';

class GunplaDetailsScreen extends StatelessWidget {
  const GunplaDetailsScreen({
    Key key,
    @required this.gunpla,
  })  : assert(gunpla != null),
        super(key: key);
  final Gunpla gunpla;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(gunpla.name),
      ),
      body: ListView(
        children: [
          if (gunpla.flickrImages.isNotEmpty) _ImageHeader(gunpla: gunpla),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gunpla.name,
                  style: textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  gunpla.description,
                  style: textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({
    Key key,
    @required this.gunpla,
  }) : super(key: key);
  final Gunpla gunpla;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Hero(
        tag: 'hero-${gunpla.id}-image',
        child: PageView(
          children: [
            for (final url in gunpla.flickrImages)
              Image.network(
                url,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
