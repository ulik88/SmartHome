import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/resources/resources.dart';
import 'package:smart_home/theme/app_colors.dart';

import 'file_picker.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
      child: FloatingActionButton(
        child: Icon(Icons.add, size: 40),
        elevation: 20,
        backgroundColor: AppColors.splashColor,
        onPressed: () {
          var descriptionController = TextEditingController();
          var titleController = TextEditingController();
          showDialog<FloatingActionButton>(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: Colors.white.withOpacity(0.9),
              insetPadding: // For AlertDialog Widget is the best!
                  EdgeInsets.symmetric(vertical: 238),
              actionsAlignment: MainAxisAlignment.spaceAround,
              title: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Center(
                    child: Text("Add new applience!",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold))),
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
                      labelText: "Type here the name..",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        borderSide:
                            BorderSide(color: Color(0x65D9D094), width: 2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      FilePicker())),
                          child: Text(
                            "Choose an image",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Undo",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                FlatButton(
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
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
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
