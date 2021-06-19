import 'package:flutter/material.dart';
import 'package:gunpla_database/app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gunpla_database/home/home_screen.dart';

class AddGunplaScreen extends StatefulWidget {
  AddGunplaScreen({Key key}) : super(key: key);

  @override
  _AddGunplaScreenState createState() => _AddGunplaScreenState();
}

class _AddGunplaScreenState extends State<AddGunplaScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController seriesController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController scaleController = TextEditingController();
  TextEditingController exclusiveController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  Map<String, dynamic> gunplaToAdd;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('gunpla');

  addGunpla() {
    gunplaToAdd = {
      "name": nameController.text,
      "series": seriesController.text,
      "grade": gradeController.text,
      "scale": scaleController.text,
      "exclusive": exclusiveController.text,
      "image": imageUrlController.text,
    };
    collectionReference
        .add(gunplaToAdd)
        .whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text("Gunpla added to Database"),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "ADD GUNPLA",
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "All field are required",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: "Series",
                      border: OutlineInputBorder(),
                    ),
                    controller: seriesController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: "Grade",
                      helperText: "Add coma after every grade",
                      border: OutlineInputBorder(),
                    ),
                    controller: gradeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: "Scale",
                      helperText: "Add coma after every scale",
                      border: OutlineInputBorder(),
                    ),
                    controller: scaleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: "Exclusive",
                      border: OutlineInputBorder(),
                    ),
                    controller: exclusiveController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: "Image Url",
                      border: OutlineInputBorder(),
                    ),
                    controller: imageUrlController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: raisedButtonStyle2,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addGunpla();
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        });
                      }
                    },
                    child: Text(
                      'Add Gunpla to Database',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            //   ),
          ),
        ));
  }
}
