import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_home/presentatoin/widgets/appliances_list.dart';

class AppliancesList1 extends StatelessWidget {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //TODO: Retrive all records in collection from Firestore
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('aplliences').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            return new ListView(
              padding: EdgeInsets.only(bottom: 80),
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Update Dilaog"),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Title:\t ",
                                      textAlign: TextAlign.start,
                                    ),
                                    TextField(
                                      controller: titleController,
                                      decoration: InputDecoration(
                                        hintText: document['title'],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Description:\t "),
                                    ),
                                    TextField(
                                      controller: descriptionController,
                                      decoration: InputDecoration(
                                        hintText: document['description'],
                                      ),
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: RaisedButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        Navigator.of(context)
                                            .userGestureInProgressNotifier
                                            .addListener(() {
                                          AppliancesList1();
                                        });
                                      },
                                      child: Text(
                                        "Undo",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  // Update Button

                                  RaisedButton(onPressed: () {
                                    Map<String, dynamic> updateUser =
                                        new Map<String, dynamic>();
                                    updateUser["title"] = titleController.text;
                                    updateUser["description"] =
                                        descriptionController.text;

                                    // Updae Firestore record information regular way
                                    FirebaseFirestore.instance
                                        .collection("aplliences")
                                        .doc(document.id)
                                        .update(updateUser)
                                        .whenComplete(() {
                                      Navigator.of(context).pop();
                                    });

                                    Text(
                                      "update",
                                      style: TextStyle(
                                          color: Colors.white,
                                          backgroundColor: Colors.red),
                                    );
                                  })
                                ],
                              );
                            });
                      },
                      title: new Text("Title " + document['title']),
                      subtitle:
                          new Text("Description " + document['description']),
                      trailing:
                          // Delete Button
                          InkWell(
                        onTap: () {
                          //TODO: Firestore delete a record code
                          FirebaseFirestore.instance
                              .collection("aplliences")
                              .doc(document.id)
                              .delete()
                              .catchError((e) {
                            print(e);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
