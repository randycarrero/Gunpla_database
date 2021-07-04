import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Profile extends StatefulWidget {
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
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  CircleAvatar(
                    radius: 65.0,
                    backgroundImage: AssetImage("assets/images/gunplalp.jpg"),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Email:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '$email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ]),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.30,
                  left: 10.0,
                  right: 10.0,
                  child: Card(
                      child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Column(
                          children: [
                            Text(
                              'Gunplas Built',
                              style: TextStyle(fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "$counter",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            )
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Text(
                              'Favortied Gunplas',
                              style: TextStyle(fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '$counter',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                  ))),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  print("Click event on Container");
                },
                child: Card(
                  child: ListTile(
                    title: Text('Favorite List'),
                    trailing: Icon(Icons.chevron_right_sharp),
                    leading: Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              PieChart(
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
            ],
          ),
        ],
      ),
    );
  }
}
