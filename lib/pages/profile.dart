import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              Expanded(
                flex: 3,
                child: Container(
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
                    )
                  ]),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Center(
                      child: Card(
                          margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                          child: Container(
                              width: 310.0,
                              height: 250.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Information",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.start,
                                    //   children: [
                                    //     Icon(
                                    //       Icons.home,
                                    //       color: Colors.blueAccent[400],
                                    //       size: 30,
                                    //     ),
                                    //     SizedBox(
                                    //       width: 20.0,
                                    //     ),
                                    //     Column(
                                    //       crossAxisAlignment:
                                    //           CrossAxisAlignment.start,
                                    //       children: [
                                    //         Text(
                                    //           "N/A",
                                    //           style: TextStyle(
                                    //             fontSize: 15.0,
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     )
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 20.0,
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.start,
                                    //   children: [
                                    //     Icon(
                                    //       Icons.auto_awesome,
                                    //       color: Colors.yellowAccent[400],
                                    //       size: 30,
                                    //     ),
                                    //     SizedBox(
                                    //       width: 20.0,
                                    //     ),
                                    //     Column(
                                    //       crossAxisAlignment:
                                    //           CrossAxisAlignment.start,
                                    //       children: [
                                    //         Text(
                                    //           "N/A",
                                    //           style: TextStyle(
                                    //             fontSize: 15.0,
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     )
                                    //   ],
                                    // ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.pinkAccent[400],
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Favorite List",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.start,
                                    //   children: [
                                    //     Icon(
                                    //       Icons.people,
                                    //       color: Colors.lightGreen[400],
                                    //       size: 30,
                                    //     ),
                                    //     SizedBox(
                                    //       width: 20.0,
                                    //     ),
                                    //     Column(
                                    //       crossAxisAlignment:
                                    //           CrossAxisAlignment.start,
                                    //       children: [
                                    //         Text(
                                    //           "N/A",
                                    //           style: TextStyle(
                                    //             fontSize: 15.0,
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     )
                                    //   ],
                                    // ),
                                  ],
                                ),
                              )))),
                ),
              ),
            ],
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
                    // Container(
                    //   child: Column(children: [
                    //     Text(
                    //       'N/A',
                    //       style: TextStyle(
                    //           color: Colors.grey[400], fontSize: 14.0),
                    //     ),
                    //     SizedBox(
                    //       height: 5.0,
                    //     ),
                    //     Text(
                    //       ' 7th',
                    //       style: TextStyle(
                    //         fontSize: 15.0,
                    //       ),
                    //     )
                    //   ]),
                    // ),
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
              )))
        ],
      ),
    );
  }
}
