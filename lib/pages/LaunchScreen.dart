import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/models/LaunchModel.dart';
import 'package:flutter_template/pages/auth/SignIn.dart';
import 'package:flutter_template/utilities/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'Home.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  final _myDuration = Duration(seconds: 5);
  var _myOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:5),(){
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: SignIn(),
        ),
      );
    });
    Timer(Duration(seconds: 2),(){
      _myOpacity =1.0;
    });

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child:Container(
        color: primaryColor,
        child: Center(
          child: AnimatedOpacity(
            duration: _myDuration,
            opacity: _myOpacity,
            child: Image(image: AssetImage('assets/home_icon3.png')),
          ),
        ),
      ) ,
    );
  }
}
