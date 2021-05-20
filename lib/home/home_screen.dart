import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.read<Backend>().signOut();
            },
            icon: const Icon(Icons.logout),
          ),
          title: const Text('Gunpla Database')),
      body: Container(),

    );
  }
}

class Gunpla_list_tile extends StatefulWidget {
  @override
  _Gunpla_list_tileState createState() => _Gunpla_list_tileState();
}

class _Gunpla_list_tileState extends State<Gunpla_list_tile>{
  @override
  Widget build(BuildContext content){
    return Container();
  }
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
class GunplaDetailsScreen extends StatefulWidget {
  @override
  _GunplaDetailsScreenState createState() => _GunplaDetailsScreenState();
}
class _GunplaDetailsScreenState extends State<GunplaDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}//4:33

//      FutureBuilder(
//      future: context.read<Backend>().getGunplas(),
//      builder: (context, snapshot) {
//        if (snapshot.hasError) {
//         return const Center(
//          child: Text('An error occurred.'),
//       );
//    } else if (!snapshot.hasData) {
//     return const Center(
//      child: CircularProgressIndicator(),
//   );
//} else {
//           return ListView(
//          );
//       }
//    },
// ),
