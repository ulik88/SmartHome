import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentatoin/bloc/appliances_bloc.dart';
import 'package:smart_home/presentatoin/bloc/appliances_event.dart';
import 'package:smart_home/presentatoin/bloc/appliances_state.dart';

class ActionButtons extends StatefulWidget {
  @override
  _ActionButtonsState createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  @override
  Widget build(BuildContext context) {
    /*  final ApplianceBloc applianceBloc = BlocProvider.of<ApplianceBloc>(context); */

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          color: Colors.lightGreen,
          child: Text('Load'),
          onPressed: () {
            /*   applianceBloc.add(ApplianceLoadEvent()); */
          },
        ),
        SizedBox(
          width: 10,
        ),
        RaisedButton(
          color: Colors.yellow.shade900,
          child: Text('Delete'),
          /*   onPressed: () {
            applianceBloc.add(ApplianceClearEvent());
          }, */
        ),
      ],
    );
  }
}
