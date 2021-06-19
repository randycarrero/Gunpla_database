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
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey.shade900,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "ADD GUNPLA",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "All field are required",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: kBoxDecorationStyle,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none),
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
                  decoration: kBoxDecorationStyle,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: "Series",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none),
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
                  decoration: kBoxDecorationStyle,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: "Grade",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none),
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
                  decoration: kBoxDecorationStyle,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: "Scale",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none),
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
                  decoration: kBoxDecorationStyle,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: "Exclusive",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none),
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
                  decoration: kBoxDecorationStyle,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: "Image Url",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none),
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
                    style: raisedButtonStyle,
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
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 12.0,
                        fontFamily: 'OpenSans',
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
