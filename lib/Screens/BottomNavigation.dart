import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:doctorx/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({Key? key}) : super(key: key);

  @override
  _BottomNavigationbarState createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  var _bottomNavIndex=0;
  final Screen=[
    HomeScreen(),
    Center(child: Text('Profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),

  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Screen[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },child: Text('START',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.deepPurpleAccent,
        icons: [
          Icons.home,
          Icons.person,

        ],
        inactiveColor: Colors.black,
        activeColor: Colors.white,
        elevation: 0,
        iconSize: 25,

       
        gapLocation: GapLocation.center,
        activeIndex: _bottomNavIndex,
        leftCornerRadius: 32,
        rightCornerRadius: 30,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),



    );


  }
}
