import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/presentatoin/pages/personal.dart';
import 'package:smart_home/resources/resources.dart';
import 'package:smart_home/services/appliences_list_firebase.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/theme/app_colors.dart';

class AppliancesList extends StatefulWidget {
  const AppliancesList({Key? key}) : super(key: key);

  @override
  _AppliancesListState createState() => _AppliancesListState();
}

class _AppliancesListState extends State<AppliancesList> {
  void _updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  void _navigatorTop() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(
            builder: (BuildContext context) => Personal()))
        .whenComplete(
          () => Future<void>.delayed(Duration(milliseconds: 500))
              .then((_) => _updateAppbar()),
        );
  }

  @override
  void initState() {
    _updateAppbar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Text(
              'My Home ',
              style: TextStyle(
                fontFamily: 'SF Rounded',
                fontSize: 28,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Image(
                      image: AssetImage(AppImages.lightning),
                      width: 50,
                      height: 50),
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
                            '20,05',
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
            height: 20,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: 420,
            height: 110,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.1),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Image(
                      image: AssetImage(AppImages.rooter),
                      width: 50,
                      height: 50),
                ),
                Container(
                  padding: EdgeInsets.only(left: 2, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name, Location',
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
                            ' Worms Germany',
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
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.01, 0.13),
                      end: Alignment(0.77, 0.74),
                      colors: [AppColors.splashColor, AppColors.detectorColor],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    child: Text('Owner',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)),

                    //  void _navigatorTop() funktion erstellt
                    onPressed: () => _navigatorTop(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AppliancesListFireBase(),
          ),
        ],
      ),
    );
  }
}
