import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentatoin/bloc/appliances_bloc.dart';
import 'package:smart_home/presentatoin/bloc/appliances_event.dart';
import 'package:smart_home/presentatoin/bloc/appliances_state.dart';
import 'package:smart_home/presentatoin/pages/details_page.dart';
import 'package:smart_home/services/appliences_list.dart';

class AppliancesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
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

      if (state is ApplianceLoadedState) {
        return GridView.custom(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (2 / 1),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          childrenDelegate: SliverChildListDelegate(
            state.loadedAppliance
                .map(
                  (data) => GestureDetector(
                      onTap: () {
                        if (_bloc == ColorEvent) {
                          return _bloc.add(ColorEvent.event_red);
                        } else {
                          _bloc.add(ColorEvent.event_green);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppliancesList1(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.green,
                        child: ListTile(
                          leading: Text(
                            'ID: ${state.loadedAppliance}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          title: Column(
                            children: <Widget>[
                              BlocBuilder<ColorBloc, Color>(
                                builder: (context, currentColor) =>
                                    AnimatedContainer(
                                        height: 40,
                                        width: 40,
                                        duration: Duration(milliseconds: 300),
                                        color: currentColor),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Title: ${state.loadedAppliance}.',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    'Completed: ${state.loadedAppliance.length}',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                )
                .toList(),
          ),
        );
      }
      if (state is ApplianceErrorState) {
        return Center(
          child: Text(
            'Error fetching ',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
      return CircularProgressIndicator();
    });
  }
}
