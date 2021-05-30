import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/bloc/appliances_bloc.dart';
import 'package:smart_home/services/appliances_repository.dart';
import 'package:smart_home/services/authentication_service.dart';
import 'package:smart_home/widgets/action_buttons.dart';
import 'package:smart_home/widgets/appliances_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appliancesRepository = AppliancesRepository();
    return BlocProvider<ApplianceBloc>(
      create: (context) =>
          ApplianceBloc(appliancesRepository: appliancesRepository),
      child: Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          title: Text('List of Appliance'),
          actions: <Widget>[
            IconButton(
              focusColor: Colors.white,
              onPressed: () {
                context.read<AuthService>().signOut();
              },
              icon: Icon(Icons.logout_sharp),
            ),
          ],
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            Expanded(child: AppliancesList()),
          ],
        ),
      ),
    );
  }
}
