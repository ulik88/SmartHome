import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_home/presentatoin/bloc/appliances_bloc.dart';
import 'package:smart_home/presentatoin/widgets/action_buttons.dart';
import 'package:smart_home/presentatoin/widgets/appliances_list.dart';
import 'package:smart_home/services/appliances_repository.dart';
import 'package:smart_home/services/appliences_list_firebase.dart';
import 'package:smart_home/services/authentication_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
/*    /*  final appliancesRepository = AppliancesRepository(); */
    return BlocProvider<ApplianceBloc>(
      create: (context) =>
          ApplianceBloc(appliancesRepository: appliancesRepository), */
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Appliance'),
        actions: <Widget>[
          IconButton(
            focusColor: Colors.white,
            onPressed: () {
              context.read<AuthService>().signOut();
            },
            icon: Icon(Icons.logout_sharp),
          ),
        ],
        centerTitle: true,
      ),
      body: AppliancesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Add"),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Title: ",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextField(
                        controller: titleController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Description: "),
                      ),
                      TextField(
                        controller: descriptionController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Undo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    //Add Button

                    RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        //TODO: Firestore create a new record code

                        Map<String, dynamic> newList =
                            new Map<String, dynamic>();
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
                        "save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              });
        },
        backgroundColor: Colors.red,
        tooltip: 'Add Title',
        child: Icon(Icons.add),
      ),

      /*  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ActionButtons(),
            Expanded(child: AppliancesListFireBase()),
          ],
        ), */
    );
  }
}
