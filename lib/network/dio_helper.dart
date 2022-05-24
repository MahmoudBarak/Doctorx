import 'package:dio/dio.dart';
import 'package:doctorx/model/OuestionModel.dart';


class DioHelper{
  final String url="http://127.0.0.1:5000/predict";

  Future<QuestionModel> messagePost(final QuestionModel messages ) async{
    Response response=  await Dio().post(url,data: messages );
    return(response.data);
  }
}

