import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'login.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
   Future.delayed(Duration(seconds: 10) ,(){
    Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
    builder: (_) =>Login(),
    ),
    (route) => false);


   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            LoadingAnimationWidget.inkDrop(color: Colors.deepPurple, size: 20)
          ],
        ),
      ) ,
    );
  }
}
