class QuestionModel {
  String message;

  QuestionModel(
      {required this.message,
      });

  Map<dynamic, dynamic>tojson()=> {

        "message": message

  };

}
class AnswerModel{

  List<dynamic> answer;
  AnswerModel({
    required this.answer
});
  factory AnswerModel.fromJson(Map<dynamic, dynamic> json){
    return AnswerModel(
      answer:json["answer"],
    );
  }


}