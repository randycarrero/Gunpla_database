import 'package:flutter/material.dart';
import 'package:gunpla_database/app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddGunplaScreen extends StatefulWidget {
  AddGunplaScreen({Key key}) : super(key: key);

  @override
  _AddGunplaScreenState createState() => _AddGunplaScreenState();
}

class _AddGunplaScreenState extends State<AddGunplaScreen> {
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
        .whenComplete(() => print("added to Database"));
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: kBoxDecorationStyle,
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
      ),
    );
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
        child: Column(
          children: [
            Text(
              "Add Gunpla",
              style: TextStyle(color: Colors.white, fontSize: 28),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            _buildTextField(nameController, "Name"),
            SizedBox(
              height: 20,
            ),
            _buildTextField(seriesController, "Series"),
            SizedBox(
              height: 20,
            ),
            _buildTextField(gradeController, "Grade"),
            SizedBox(
              height: 20,
            ),
            _buildTextField(scaleController, "Scale"),
            SizedBox(
              height: 20,
            ),
            _buildTextField(exclusiveController, "Exclusive"),
            SizedBox(
              height: 20,
            ),
            _buildTextField(imageUrlController, "Image Url"),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  addGunpla();
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
      ),
    );
  }
}
