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
    bool isChecked = false;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                      child: Text("Set up your Appliences",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold))),
                ),
                Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    height: 100,
                    child: Row(
                      children: [
                        Text('Favorites', style: TextStyle(fontSize: 18)),
                        // Checkbox for choose of Settings and shows the ListView of items
                        Checkbox(
                          autofocus: true,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        SizedBox(width: 110),
                        Text(
                          'Bills',
                          style: TextStyle(fontSize: 18),
                        ),
                        // Checkbox for choose of Settings and shows the ListView of items
                        Checkbox(
                          value: isChecked = true,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ],
                    )),
                SizedBox(height: 5),
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
            trailing: Icon(Icons.share_rounded),
          ),
          Container(
            height: 130.0,
            child: Ink.image(
              width: 300,
              height: 300,
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
                child: const Text('DETAILS'),
                onPressed: () {
                  //
                },
              )
            ],
          )
        ],
      ));
}
