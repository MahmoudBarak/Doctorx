import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Screens/Splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This Screens is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            dividerTheme: DividerThemeData(color: Colors.grey[300]),
            primaryColor: Colors.deepPurpleAccent,
            drawerTheme: DrawerThemeData(
              backgroundColor: Colors.white,
              elevation: 5,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurpleAccent,
              elevation: 0,
              extendedTextStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            ),
            appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark)),
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: TextTheme(
                bodyText1: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            )),
            textButtonTheme: TextButtonThemeData(
                style:
                    TextButton.styleFrom(elevation: 0, primary: Colors.grey))),
        ///DarkTheme
        darkTheme: ThemeData(
            scaffoldBackgroundColor: HexColor( '#1a1a1a'),
            dividerTheme: DividerThemeData(color: Colors.white60),
            primaryColor: Colors.amber,
            drawerTheme: DrawerThemeData(
              backgroundColor: HexColor( '#1a1a1a'),
              elevation:0,
            ),

            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.amber,
                elevation: 0,
                extendedTextStyle: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
            appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor( '#1a1a1a'),
                    statusBarIconBrightness: Brightness.light)),
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: TextTheme(
                bodyText1: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            )),
            textButtonTheme: TextButtonThemeData(
                style:
                    TextButton.styleFrom(elevation: 0, primary: Colors.grey))),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: SplachScreen());
  }
}
