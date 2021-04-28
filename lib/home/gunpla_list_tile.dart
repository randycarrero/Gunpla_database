import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:provider/provider.dart';
import 'package:ant_icons/ant_icons.dart';

class GunplaListTile extends StatelessWidget {
  final Gunpla gunpla;

  final VoidCallback onTap;
  const GunplaListTile({
    Key key,
    @required this.gunpla,
    @required this.onTap,
  })  : assert(gunpla != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      onTap: onTap,
      leading: gunpla.image.isEmpty
          ? null
          : Hero(
              tag: 'hero-${gunpla.id}-image',
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Image.network(
                    gunpla.image,
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
        gunpla.series,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.chevron_right_sharp),
    );
  }
}
