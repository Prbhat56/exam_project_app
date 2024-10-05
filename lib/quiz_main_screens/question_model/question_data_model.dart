// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionModel {
  String? question;
  Map<String, bool> answer;
  String? imagePath;
  String? questiontype;
  QuestionModel({
    this.question,
    required this.answer,
    this.imagePath,
    this.questiontype
  });
}
