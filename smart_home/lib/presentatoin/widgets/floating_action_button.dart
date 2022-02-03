import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/resources/resources.dart';
import 'package:smart_home/theme/app_colors.dart';

class FloatingButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0,0.0),
      child: FloatingActionButton(
        child:Icon(Icons.add, size: 40),
        elevation: 30,
        backgroundColor: AppColors.splashColor,
          onPressed: () {
            var descriptionController = TextEditingController();
            var titleController = TextEditingController();
            showDialog<FloatingActionButton>(
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: Colors.white.withOpacity(0.7),
                insetPadding: // For AlertDialog Widget is the best!
                EdgeInsets.symmetric(vertical: 200),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                title: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                      child: Text("Add new Applience!",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold))),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(

                      textAlign: TextAlign.start,
                      controller: titleController,
                      decoration: InputDecoration(
                        fillColor: Colors.white60,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.add_alert,
                          color: Colors.redAccent,
                        ),
                        hintStyle: TextStyle(color: Colors.redAccent),
                        labelText: " Type here...",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14.0)),
                          borderSide:
                          BorderSide(color: Color(0x65D9D094), width: 2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    TextField(
                      enabled: false,
                      textAlign: TextAlign.start,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        fillColor: Colors.white60,
                        filled: true,
                        prefixIcon: Icon(Icons.add_a_photo),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Bild auswählen..",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14.0)),
                          borderSide:
                          BorderSide(color: Color(0x65D9D094), width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: RaisedButton(
                      color: AppColors.splashColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Undo",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  RaisedButton(
                    color: AppColors.splashColor,
                    onPressed: () {
                      Map<String, dynamic> newList = new Map<String, dynamic>();
                      newList["title"] = titleController.text;
                      newList["description"] = descriptionController.text;

                      FirebaseFirestore.instance
                          .collection("aplliences")
                          .add(newList)
                          .whenComplete(() {
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
    );
  }
}