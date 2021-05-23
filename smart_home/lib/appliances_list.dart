import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppliancesList extends StatefulWidget {
  @override
  State createState() => AppliancesListState();
}

class AppliancesListState extends State<AppliancesList> {
  List<String> items = [];
  final microwave = TextEditingController();
  final coffeeMaker = TextEditingController();
  final mixer = TextEditingController();

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
  Widget build(BuildContext ctxt) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Microwave'),
              controller: microwave,
              onSubmitted: (text) {
                items.add(text);
                microwave.clear();
                setState(() {});
              },
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Coffee Maker'),
              controller: coffeeMaker,
              onSubmitted: (text) {
                items.add(text);
                coffeeMaker.clear();
                setState(() {});
              },
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Mixer'),
              controller: mixer,
              onSubmitted: (text) {
                items.add(text);
                mixer.clear();
                setState(() {});
              },
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
