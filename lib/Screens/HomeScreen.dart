import 'package:doctorx/Screens/boot_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key , }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState>_globalKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BootScreen()));
        },
        child: Text(
          'START',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      drawer: Drawer(

        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [drawerHeader(), drawerItem()],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
             Row(children: [ IconButton(onPressed: (){
               _globalKey.currentState?.openDrawer();
             }, icon: Icon(Icons.menu))],)
            ],),
        ),
      ) ,
    );
  }
  Widget drawerHeader() {
    return Container(
        color: Colors.deepPurpleAccent,

        width: double.infinity,
        height: 200,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(backgroundImage: AssetImage('assets/images/logo.png'),backgroundColor: Colors.white,radius: 50,),
            SizedBox(height: 5,),
            Text('Medical Expert System',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),)
          ],)
    );
  }

  Widget drawerItem() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark Mode',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.toggle_on_outlined,
                    size: 40,
                  ))
            ],
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
