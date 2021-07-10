import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gunpla_database/pages/favorites_screen.dart';
import 'package:pie_chart/pie_chart.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, double> dataMap = {
    "Real Grade": 5,
    "High Grade": 3,
    "Perfect Grade": 2,
    "No Grade": 2,
  };
  String email = FirebaseAuth.instance.currentUser.email;
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Container(
                  width: 150,
                  height: 150,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/images/gunplalp.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 35.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  '$email',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Gunplas Built',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            '0',
                            style: TextStyle(fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Favorite Gunplas',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            '0',
                            style: TextStyle(fontSize: 15.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Color(0xFFCE0018),
                  ),
                  title: Text(
                    'Favorite List',
                    style: TextStyle(color: Color(0xFFcfcfcf)),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFcfcfcf),
                    size: 20,
                  ),
                  tileColor: Color(0xFF3c3c3c),
                  dense: false,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoriteScreen()));
                  },
                ),
              ),
              Expanded(
                child: Container(
                  child: PieChart(
                    dataMap: dataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    // colorList: colorList,
                    initialAngleInDegree: 0,
                    legendOptions: LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.right,
                      showLegends: true,
                      legendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: false,
                      decimalPlaces: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
