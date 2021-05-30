import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/bloc/appliances_bloc.dart';
import 'package:smart_home/bloc/appliances_state.dart';

class AppliancesList extends StatelessWidget {
  const AppliancesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplianceBloc, ApplianceState>(
        builder: (context, state) {
      if (state is ApplianceEmptyState) {
        return Center(
          child: Text(
            'No Data recieved, press button "Load"',
          ),
        );
      }
      if (state is ApplianceLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ApplianceLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ApplianceLoadedState) {
        return ListView.builder(
          itemCount: state.loadedAppliance.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Text(
                'ID: ${state.loadedAppliance[index].userId}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: <Widget>[
                  Text(
                    '${state.loadedAppliance[index].id}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Title: ${state.loadedAppliance[index].title}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Completed: ${state.loadedAppliance[index].completed}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
      if (state is ApplianceErrorState) {
        return Center(
          child: Text(
            'Erroe fetching ',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
      return CircularProgressIndicator();
    });
  }
}

/* @override
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
  } */

/* return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              context.read<AuthService>().signOut();
            },
            icon: Icon(Icons.logout_sharp),
          ),
        ],
      ),
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
    ); */
