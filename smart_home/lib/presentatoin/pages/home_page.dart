import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_home/presentatoin/bloc/appliances_bloc.dart';
import 'package:smart_home/presentatoin/widgets/action_buttons.dart';
import 'package:smart_home/presentatoin/widgets/appliances_list.dart';
import 'package:smart_home/services/appliances_repository.dart';
import 'package:smart_home/services/authentication_service.dart';

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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ActionButtons(),
            Expanded(child: AppliancesList()),
          ],
        ),
      ),
    );
  }
}
