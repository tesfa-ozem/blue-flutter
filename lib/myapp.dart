import 'package:catcher/catcher_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/pages/Home.dart';
import 'package:flutter_template/pages/LaunchScreen.dart';
import 'package:flutter_template/utilities/colors.dart';
import 'package:flutter_template/widgets/widgets.dart';

import 'utilities/styles.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget _buildAndroidHomePage(BuildContext context) {
    return MaterialApp(
      navigatorKey: Catcher.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/':(context)=>LaunchScreen(),


        /*'/SignUp': (context) =>SignIn(),
			'/SignUp': (context) =>SignIn(),*/
      },
      theme: _myjijiTheme,
    );
  }

  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoApp(
        debugShowCheckedModeBanner: false,
        color: Styles.appBackground,
        home: Home(), theme: CupertinoThemeData(primaryColor: primaryColor)
    );
  }
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,

    );
  }
}

final ThemeData _myjijiTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
      headline: base.headline.copyWith(
        fontWeight: FontWeight.w500,
      ),
      title: base.title.copyWith(fontSize: 18.0),
      caption: base.caption.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
    )
        .apply(
      fontFamily: 'Rubik',
    );
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
    accentColor: accentColor,
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
  );
}