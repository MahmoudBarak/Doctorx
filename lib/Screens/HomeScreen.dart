import 'package:doctorx/Screens/boot_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
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
          style: TextStyle(color: Colors.black),
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
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        _globalKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu)),
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(
                height: 300,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        backgroundColor: Colors.grey.shade200,
                        radius: 60,
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'Hi Mahmoud. I can \n help you uncover what \n may be causing your symptoms.\n Just click on start.',
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerHeader() {
    return Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
              backgroundColor: Colors.white,
              radius: 50,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Medical Expert System',
              style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),
            )
          ],
        ));
  }

  Widget drawerItem() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark Mode',
                  style: Theme.of(context).textTheme.bodyText1),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.brightness_2,
                    size: 30,
                  ))
            ],
          ),
          Divider(
            thickness: 2,
          ),
          Row(

            children:[
              Icon(Icons.person,size: 30,) ,
            Container(
              width: 250,
            child: TextButton(
              style:ButtonStyle(alignment: Alignment.bottomLeft),
              onPressed: () {},

              child: Text(
                'Profile',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),],),

          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
