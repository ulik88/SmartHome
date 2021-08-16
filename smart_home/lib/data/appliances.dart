import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Appliance extends StatefulWidget {
  int id;
  SvgPicture image;
  String name;
  String title;
  bool status;
  double height;
  double width;

  Appliance({this.title, this.name, this.image});

  @override
  _ApplianceState createState() => _ApplianceState();
}

class _ApplianceState extends State<Appliance> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    //
    bool svgProvided = widget.image == null ? false : true;
    print('is svg provided: $svgProvided'); //log

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          print('Button Selected = $isSelected'); //log
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(27),
        ),
        child: Container(
          decoration: isSelected
              ? BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color(0xff5fe686).withOpacity(0.26),
                      Color(0xff262d2e).withOpacity(0.23)
                    ],
                    radius: 0.72,
                    center: Alignment(0, 0),
                  ),
                  border: Border.all(
                    width: 4,
                    color: const Color(0xff5fe686),
                  ),
                  borderRadius: BorderRadius.circular(27),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                      color: const Color(0xff000000).withOpacity(0.16),
                    )
                  ],
                )
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: 'SF Rounded',
                  fontSize: 21,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              Visibility(
                visible: widget.image == null ? false : true,
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: widget.image ?? null,
                  ),
                ),
              ),
              //
              Text(
                widget.name,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 21,
                  color: Colors.white.withOpacity(0.14),
                ),
              )
            ],
          ),
        ),
      ),
    );
    //
  }
}
