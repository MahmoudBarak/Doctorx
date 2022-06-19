import 'package:doctorx/model/OuestionModel.dart';
import 'package:doctorx/network/dio_helper.dart';
import 'package:flutter/material.dart';


class BootScreen extends StatefulWidget {
  const BootScreen({Key? key}) : super(key: key);

  @override
  _BootScreenState createState() => _BootScreenState();
}



class _BootScreenState extends State<BootScreen> {
  @override
  void initState() {
    DioHelper().answerGet();
    super.initState();
  }
 bool cyes=false;
  bool cno=false;
  List answers=[];


  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 10,),

            Padding(
                padding: EdgeInsets.only(left: 8),
                child: Container(
                  height: 600,
                  child: _answerList(),

                )
            ),
            SizedBox(height: 10,),

            Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Theme
                      .of(context)
                      .primaryColor),
              child: TextButton(
                onPressed: () {

                },
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:Colors.white),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }


  Widget _answerList() {
    return FutureBuilder<Map>(
        future: DioHelper().answerGet(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if(snapshot.connectionState==ConnectionState.done){
          return Container(
              height: 200,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:snapshot.data!['answer']?.length,
                  itemBuilder: (context, index) {
                     var answer= snapshot.data!['answer'][index];
                     print('$answers');
                    return _answer(answer!);
                  }));}
          return Column(
            children: [
              Text("NULL")
            ],
          );
        }
    );
  }

  Widget _answer( var answer) {

    return Container(
      child: Column(
        children: [
          Text('${answer}', style: Theme
              .of(context)
              .textTheme
              .bodyText1,),

          buttons(),


          Divider(thickness: 2,color: Colors.black,),

        ],
      ),
    );

  }
  Widget buttons(){
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Theme
                      .of(context)
                      .primaryColor),
              child: TextButton(
                onPressed: () {
                  var yes='yes';
                  setState(() {
                    cyes=!cyes;

                    answers.add(yes);

                  });


                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:cyes? Colors.red:Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Theme
                      .of(context)
                      .primaryColor),
              child: TextButton(
                onPressed: () {
                  var no='no';
                  setState(() {
                    cno=!cno;

                    answers.add(no);

                  });

                },
                child: Text(
                  'No',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:cno?Colors.red:Colors.white),
                ),
              ),
            ),
          ],
        )
    );
  }


}
