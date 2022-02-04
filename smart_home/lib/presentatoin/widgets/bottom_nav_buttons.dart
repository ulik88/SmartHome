import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/presentatoin/pages/settings.dart';
import 'package:smart_home/presentatoin/pages/personal.dart';
import 'package:smart_home/presentatoin/widgets/appliances_list.dart';

import 'floating_action_button.dart';

class BottomNavButtons extends StatefulWidget {
  @override
  State<BottomNavButtons> createState() => _BottomNavButtonsState();
}

class _BottomNavButtonsState extends State<BottomNavButtons> {
  static const List<Widget> _widgetOptions = <Widget>[
    AppliancesList(),
    Notifications(),

    //Personal(),
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
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: onSelectTab,
      ),

      /* child: BottomAppBar();*/
    );
  }
}
