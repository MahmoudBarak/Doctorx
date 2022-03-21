import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'login.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
 ////

  @override
  Widget build(BuildContext context) {
    return  SplashScreenView(
      duration: 2000,
      imageSize: 200,
      imageSrc: 'assets/images/logo.png',
      text: 'Medical Expert System',
      textType: TextType.ScaleAnimatedText,
      textStyle: TextStyle(fontWeight: FontWeight.bold),
      backgroundColor: Colors.white,
      navigateRoute: Login() ,
    )
    ;
  }
}
