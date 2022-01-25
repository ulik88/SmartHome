import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_home/presentatoin/bloc/appliances_bloc.dart';
import 'package:smart_home/presentatoin/widgets/action_buttons.dart';
import 'package:smart_home/presentatoin/widgets/appliances_list.dart';
import 'package:smart_home/services/appliances_repository.dart';
import 'package:smart_home/services/appliences_list_firebase.dart';
import 'package:smart_home/services/authentication_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
/*    /*  final appliancesRepository = AppliancesRepository(); */
    return BlocProvider<ApplianceBloc>(
      create: (context) =>
          ApplianceBloc(appliancesRepository: appliancesRepository), */
    return Scaffold(
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
      body: AppliancesList(),
      

      /*  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ActionButtons(),
            Expanded(child: AppliancesListFireBase()),
          ],
        ), */
    );
  }
}
