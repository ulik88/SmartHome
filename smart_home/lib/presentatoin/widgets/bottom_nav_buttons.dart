import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/presentatoin/pages/notifications.dart';
import 'package:smart_home/presentatoin/pages/personal.dart';
import 'package:smart_home/presentatoin/widgets/appliances_list.dart';

class BottomNavButtons extends StatefulWidget {
  @override
  State<BottomNavButtons> createState() => _BottomNavButtonsState();
}

class _BottomNavButtonsState extends State<BottomNavButtons> {
  static const List<Widget> _widgetOptions = <Widget>[
    Notifications(),
    AppliancesList(),
    Personal(),
  ];

  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedTab]),
      bottomNavigationBar: BottomNavigationBar(
        //selectedFontSize: 20,
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: onSelectTab,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<FloatingActionButton>(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    child: Text('Description: '),
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
                RaisedButton(
                  color: Colors.red,
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
                    "save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      /* child:     BottomAppBar()*/
    );
  }
}
