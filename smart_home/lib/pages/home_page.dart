import 'package:flutter/material.dart';
import 'package:smart_home/widgets/action_buttons.dart';
import 'package:smart_home/widgets/appliances_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        title: Text('List of Appliance'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ActionButtons(),
          Expanded(child: AppliancesList()),
        ],
      ),
    );
  }
}
