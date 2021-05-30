import 'package:flutter/material.dart';
import 'package:smart_home/bloc/appliances_bloc.dart';
import 'package:smart_home/bloc/appliances_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApplianceBloc applianceBloc = BlocProvider.of<ApplianceBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            applianceBloc.add(ApplianceLoadEvent());
          },
          color: Colors.lightGreen,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: () {
            applianceBloc.add(ApplianceClearEvent());
          },
          color: Colors.yellow.shade900,
        ),
      ],
    );
  }
}
