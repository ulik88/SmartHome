import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentatoin/bloc/appliances_bloc.dart';
import 'package:smart_home/presentatoin/bloc/appliances_event.dart';
import 'package:smart_home/presentatoin/bloc/appliances_state.dart';
import 'package:smart_home/presentatoin/pages/details_page.dart';
import 'package:smart_home/services/appliences_list_firebase.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppliancesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      backgroundColor: Color(0xff202227),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 35, left: 25),
            child: Text(
              'Sweet Home 🖐🏻',
              style: TextStyle(
                fontFamily: 'SF Rounded',
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Image.asset(
                  'assets/lightning.png',
                  scale: 0.99,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '11,5',
                            style: TextStyle(
                              fontFamily: 'SF Rounded',
                              fontSize: 54,
                              color: Colors.white.withOpacity(0.78),
                              fontWeight: FontWeight.w200,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Kwh',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: 'SF Rounded',
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Power usage for today',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.72,
                          color: Colors.white.withOpacity(0.14),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: 413,
            height: 106,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.1),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/lightning.png',
                  width: 70,
                  height: 70,
                ),
                Container(
                  padding: EdgeInsets.only(left: 2, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Example Name',
                        style: TextStyle(
                          fontFamily: 'SF Rounded',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white.withOpacity(0.25),
                          ),
                          Text(
                            'Worms Germany',
                            style: TextStyle(
                              fontFamily: 'SF Rounded',
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.25),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 77,
                  height: 29,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.01, 0.13),
                      end: Alignment(0.97, 0.84),
                      colors: [Color(0xff79fd7b), Color(0xff3dcd98)],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'OWNER',
                      style: TextStyle(
                        fontFamily: 'SF Rounded',
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black.withOpacity(0.72),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          //
          Expanded(
            child: AppliancesListFireBase(),
          ),
          //
        ],
        //
      ),
      floatingActionButton: Transform.scale(
        scale: 1,
        child: Transform.translate(
          offset: Offset(0, 18),
          child: GestureDetector(
            onTap: () {
              print('FAB tapped');
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.5, 0),
                  end: Alignment(0.5, 1),
                  colors: [Color(0xff7afc79), Color(0xff3ccb97)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 18,
                    color: Color(0xff7afc79).withOpacity(0.26),
                  )
                ],
              ),
              child: SvgPicture.asset(
                'assets/spark.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: ClipPath(
          /* clipper: NavbarClipper(), */
          child: BottomAppBar(
            elevation: 0,
            color: Color(0xff3f4144).withOpacity(0.31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.person_pin,
                      color: Colors.white.withOpacity(0.1),
                      size: 30,
                    ),
                    onPressed: null),
                IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white.withOpacity(0.1),
                      size: 30,
                    ),
                    onPressed: null),
                //
                SizedBox(
                  height: 80,
                  width: 60,
                ),
                IconButton(
                    icon: Icon(
                      Icons.message,
                      color: Colors.white.withOpacity(0.1),
                      size: 30,
                    ),
                    onPressed: null),
                IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white.withOpacity(0.1),
                      size: 30,
                    ),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
    );

    /* BlocBuilder<ApplianceBloc, ApplianceState>(
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
                            builder: (context) => AppliancesListFireBase(),
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
    }); */
  }
}
