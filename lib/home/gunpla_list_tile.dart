import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';

class GunplaListTile extends StatelessWidget {
  const GunplaListTile({
    Key key,
    @required this.gunpla,
    @required this.onTap,
  })  : assert(gunpla != null),
        super(key: key);

  final Gunpla gunpla;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      onTap: onTap,
      leading: gunpla.flickrImages.isEmpty
          ? null
          : Hero(
              tag: 'hero-${gunpla.id}-image',
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Image.network(
                    gunpla.flickrImages.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
      title: Hero(
        tag: 'hero-${gunpla.id}-name',
        child: Text(gunpla.name),
      ),
      subtitle: Text(
        gunpla.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.chevron_right_sharp),
    );
  }
}
