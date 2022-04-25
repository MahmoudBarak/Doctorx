import 'package:doctorx/Blocs/AppBloc/app_cubit.dart';
import 'package:doctorx/model/OuestionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BootScreen extends StatefulWidget {
  const BootScreen({Key? key}) : super(key: key);

  @override
  _BootScreenState createState() => _BootScreenState();
}

class _BootScreenState extends State<BootScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_outlined)),
                  ],
                ),
                SizedBox(height: 300,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        backgroundColor: Colors.grey.shade200,
                        radius: 60,
                      ),
                    ),
                    SizedBox(height: 100,),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Column(
                        children: [
                          Text('5', style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,),
                        ],
                      ),
                    ),
                    SizedBox(height: 100,),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Theme
                                      .of(context)
                                      .primaryColor),
                              child: TextButton(
                                onPressed: () {

                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),

                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Theme
                                      .of(context)
                                      .primaryColor),
                              child: TextButton(
                                onPressed: () {

                                },
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),


                  ],
                )
              ],
            ),
          ),


        );
      },
    );
  }
}

