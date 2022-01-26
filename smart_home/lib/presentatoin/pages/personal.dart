import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Personal extends StatelessWidget {
  const Personal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Screen'),
        actions: <Widget>[
          IconButton(
            focusColor: Colors.white,
            onPressed: () {
              //context.read<AuthService>().signOut();
            },
            icon: Icon(Icons.camera),
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Personally Data",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
