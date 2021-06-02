// @dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/Flats.dart';
import 'screens/FlatsListScreen.dart';
import 'screens/LoginOptionsScreen.dart';
import 'providers/flat_provider.dart';
import 'screens/student_login.dart';
import 'screens/LandlordLoginScreen.dart';
import 'screens/LandlordDashboardScreen.dart';
import 'screens/AddFlat.dart';
import 'screens/ViewFlat.dart';

//import the screen's path here
//import the screen's path here
//import the screen's path here

void main() => runApp(FoundIt());

class FoundIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(136, 14, 79, .1),
      100: Color.fromRGBO(136, 14, 79, .2),
      200: Color.fromRGBO(136, 14, 79, .3),
      300: Color.fromRGBO(136, 14, 79, .4),
      400: Color.fromRGBO(136, 14, 79, .5),
      500: Color.fromRGBO(136, 14, 79, .6),
      600: Color.fromRGBO(136, 14, 79, .7),
      700: Color.fromRGBO(136, 14, 79, .8),
      800: Color.fromRGBO(136, 14, 79, .9),
      900: Color.fromRGBO(136, 14, 79, 1),
    };
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => FlatProvider(),
        ),       
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: MaterialColor(0xff1a1c20, color),

          //accentColor: MaterialColor(0xfff9813a, color),
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Lato',
        ),
        routes: {
          '/': (ctx) => LoginOptionsScreen(),
          StudentLoginPage.routeName: (ctx) => StudentLoginPage(),
          LandlordLoginScreen.routeName: (ctx) => LandlordLoginScreen(),
          LandlordDashboardScreen.routeName: (ctx) => LandlordDashboardScreen(),
          AddFlatScreen.routeName: (ctx) => AddFlatScreen(),
          Flats.routeName: (ctx) => Flats(),
          FlatsListScreen.routeName: (ctx) => FlatsListScreen(),
          ViewFlat.routeName: (ctx)=> ViewFlat(),
          // '/second': (context) => SecondScreenName()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
