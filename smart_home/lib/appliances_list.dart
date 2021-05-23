import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppliancesList extends StatefulWidget {
  @override
  State createState() => AppliancesListState();
}

class AppliancesListState extends State<AppliancesList> {
  List<String> items = [];
  final microwave = new TextEditingController();
  final coffeeMaker = new TextEditingController();
  final mixer = new TextEditingController();

  String textFieldsAreEmpty() {
    if (microwave.text.isEmpty) {
      return "Microwave";
    }
    if (coffeeMaker.text.isEmpty) {
      return "Coffee Maker";
    }
    if (mixer.text.isEmpty) {
      return "Mixer";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                    items.add(microwave.text);
                    microwave.clear();
                    setState(() {});
                  },
                  color: Colors.blue,
                ),
                RaisedButton(
                  child: Text('Delete'),
                  onPressed: () {
                    items.clear();
                    setState(() {});
                  },
                  color: Colors.yellow,
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Microwave'),
              controller: microwave,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int Index) {
                  return Text(items[Index]);
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                    items.add(coffeeMaker.text);
                    coffeeMaker.clear();
                    setState(() {});
                  },
                  color: Colors.blue,
                ),
                RaisedButton(
                  child: Text('Delete'),
                  onPressed: () {
                    items.clear();
                    setState(() {});
                  },
                  color: Colors.yellow,
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Coffee Maker'),
              controller: coffeeMaker,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext ctxt, int Index) {
                  return Text(items[Index]);
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                    items.add(mixer.text);
                    microwave.clear();
                    setState(() {});
                  },
                  color: Colors.blue,
                ),
                RaisedButton(
                  child: Text('Delete'),
                  onPressed: () {
                    items.clear();
                    setState(() {});
                  },
                  color: Colors.yellow,
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Mixer'),
              controller: mixer,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return Text(items[Index]);
                    }))
          ],
        ),
      ),
    );
  }
}
