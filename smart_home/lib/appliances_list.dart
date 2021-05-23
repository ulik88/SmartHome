import 'package:flutter/material.dart';

class AppliancesList extends StatefulWidget {
  @override
  State createState() => new AppliancesListState();
}

class AppliancesListState extends State<AppliancesList> {
  List<String> items = [];
  final TextEditingController nCtxt = new TextEditingController();
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        body: new Column(
      children: <Widget>[
        new TextField(
          controller: nCtxt,
          onSubmitted: (text) {
            items.add(text);
            nCtxt.clear();
            setState(() {});
          },
        ),
        new Expanded(
            child: new ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext ctxt, int Index) {
                  return new Text(items[Index]);
                }))
      ],
    ));
  }
}
