class QuestionModel {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<String>? incorrectAnswers;

  QuestionModel(
      {required this.category,
       required  this.type,
       required  this.difficulty,
       required  this.question,
       required  this.correctAnswer,
       required  this.incorrectAnswers});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        category : json['category'],
        type : json['type'],
        difficulty : json['difficulty'],
    question : json['question'],
    correctAnswer : json['correct_answer'],
    incorrectAnswers : json['incorrect_answers']
    );

  }

}