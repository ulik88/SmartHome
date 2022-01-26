import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentatoin/widgets/bottom_nav_buttons.dart';
import 'package:smart_home/services/authentication_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
      body: BottomNavButtons(),
    );
  }
}
