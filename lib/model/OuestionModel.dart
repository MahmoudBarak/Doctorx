class QuestionModel {
  String message;

  QuestionModel(
      {required this.message,
      });
  factory QuestionModel.tojson(Map<String, dynamic> json) {
    return QuestionModel(
        message: 'message'

    );

  }

}