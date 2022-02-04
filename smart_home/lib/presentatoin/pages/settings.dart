// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                buildSettingCards(),
                buildSettingCards(),
                buildSettingCards(),
                buildSettingCards(),
                buildSettingCards(),
                buildSettingCards(),
                buildSettingCards(),
              ],
            )),
      ),
    );
  }
}

Card buildSettingCards() {
  var copfText = 'Device';
  var subText = 'power usage per month';
//  var cardImage=  Image();// = Provider.of<AppliancesListFireBase>(context);
  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(copfText),
            subtitle: Text(subText),
            trailing: Icon(Icons.settings),
          ),
          Container(
            height: 200.0,
            child: Ink.image(
              image: AssetImage('images/microvelle.png'),
              fit: BoxFit.cover,
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('HYSTORY'),
                onPressed: () {
                  //
                },
              ),
              TextButton(
                child: const Text('LEARN MORE'),
                onPressed: () {
                  //
                },
              )
            ],
          )
        ],
      ));
}
