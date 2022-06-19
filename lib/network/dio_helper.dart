import 'package:dio/dio.dart';

import '../model/OuestionModel.dart';



class DioHelper{
  final String url="http://10.0.2.2:5000/predict";
  final String url2="http://10.0.2.2:5000/sq";
  Future<dynamic> yesPost(dynamic yes) async{
    Response response=  await Dio().post(url,data:yes );
    return(response.data);
  }
  Future<dynamic> noPost(dynamic no) async{
    Response response=  await Dio().post(url,data:no );
    return(response.data);
  }
  Future<Map> answerGet() async{
    Response response=  await Dio(BaseOptions(connectTimeout: 20*1000,receiveDataWhenStatusError: true)).get(url2);
    return(response.data);
  }


}

