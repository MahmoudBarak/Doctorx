import 'package:doctorx/Blocs/AppBloc/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Screens/Splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This Screens is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AppCubit(),
  child: BlocConsumer<AppCubit, AppState>(
    listener: (context, state) {},
  builder: (context, state) {
    return MaterialApp(
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: AppCubit.get(context).isDark ?ThemeMode.dark:ThemeMode.light ,
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
    );
  },
),
);
  }
  ThemeData darkTheme() {
    return ThemeData(
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
            TextButton.styleFrom(elevation: 0, primary: Colors.grey)),



    );

  }
  ThemeData lightTheme(){
    return ThemeData(
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
            TextButton.styleFrom(elevation: 0, primary: Colors.grey)));
  }
}
