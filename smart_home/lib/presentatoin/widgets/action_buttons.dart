import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentatoin/bloc/appliances_bloc.dart';
import 'package:smart_home/presentatoin/bloc/appliances_event.dart';
import 'package:smart_home/presentatoin/bloc/appliances_state.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApplianceBloc applianceBloc = BlocProvider.of<ApplianceBloc>(context);
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Center(
          child: BlocBuilder<ColorBloc, Color>(
            builder: (context, currentColor) => AnimatedContainer(
                height: 40,
                width: 40,
                duration: Duration(milliseconds: 500),
                color: currentColor),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RaisedButton(
          color: Colors.lightGreen,
          child: Text('Load'),
          onPressed: () {
            applianceBloc.add(ApplianceLoadEvent());
            _bloc.add(ColorEvent.event_red);
          },
        ),
        SizedBox(
          width: 10,
        ),
        RaisedButton(
          color: Colors.yellow.shade900,
          child: Text('Delete'),
          onPressed: () {
            _bloc.add(ColorEvent.event_green);
            applianceBloc.add(ApplianceClearEvent());
          },
        ),
      ],
    );
  }
}
