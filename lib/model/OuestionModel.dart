class QuestionModel {
  String message;
  String? answer;
  QuestionModel(
      {required this.message,
        this.answer,
      });
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        message : json['message'],
    answer : json['answer'],
    );
  }

}