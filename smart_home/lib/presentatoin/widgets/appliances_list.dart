import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/presentatoin/pages/personal.dart';
import 'package:smart_home/services/appliences_list_firebase.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppliancesList extends StatefulWidget {
  const AppliancesList({Key? key}) : super(key: key);

  @override
  _AppliancesListState createState() => _AppliancesListState();
}

void _updateAppbar() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class _AppliancesListState extends State<AppliancesList> {
  @override
  void initState() {
    _updateAppbar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202227),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Text(
              'My Home ',
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
                            '18,05',
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
                        'Name, Vorname',
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
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    child: Text('Owner',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute<void>(
                            builder: (BuildContext context) => Personal()))
                        .whenComplete(
                          () =>
                              Future<void>.delayed(Duration(milliseconds: 500))
                                  .then((_) => _updateAppbar()),
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AppliancesListFireBase(),
          ),
          //
        ],
        //
      ),
      // bottomNavigationBar: BottomNavButtons(),
    );
  }
}
