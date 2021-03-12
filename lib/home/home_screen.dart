import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:gunpla_database/home/gunpla_list_tile.dart';
import 'package:gunpla_database/gunpla_details/gunpla_details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gunpla Database'),
      ),
      body: FutureBuilder(
        future: context.read<Backend>().getGunplas(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred.'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final gunplas = snapshot.data;

            return ListView(
              children: [
                for (final gunpla in gunplas) ...[
                  GunplaListTile(
                    gunpla: gunpla,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return GunplaDetailsScreen(gunpla: gunpla);
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(height: 0.0),
                ]
              ],
            );
          }
        },
      ),
    );
  }
}
