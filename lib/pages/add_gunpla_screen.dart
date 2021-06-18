import 'package:flutter/material.dart';
import 'package:gunpla_database/app/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: Column(
        children: [
          _buildTextField(nameController, "Name"),
          _buildTextField(seriesController, "Series"),
          _buildTextField(gradeController, "Grade"),
          _buildTextField(scaleController, "Scale"),
          _buildTextField(exclusiveController, "Exclusive"),
          _buildTextField(imageUrlController, "Image Url"),
        ],
      ),
    );
  }
}
