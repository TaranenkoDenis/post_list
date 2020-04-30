import 'package:stackoverflow_client/data/models/question_owner.dart';

class Question {
  List<String> tags;
  QuestionOwner owner;
  bool isAnswered;
  int viewCount;
  int answerCount;
  int score;
  int lastActivityDate;
  int creationDate;
  int questionId;
  String link;
  String title;
  int acceptedAnswerId;
  int protectedDate;
  int lastEditDate;

  Question(
      {this.tags,
      this.owner,
      this.isAnswered,
      this.viewCount,
      this.answerCount,
      this.score,
      this.lastActivityDate,
      this.creationDate,
      this.questionId,
      this.link,
      this.title,
      this.acceptedAnswerId,
      this.protectedDate,
      this.lastEditDate});

  Question.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
    owner =
        json['owner'] != null ? QuestionOwner.fromJson(json['owner']) : null;
    isAnswered = json['is_answered'];
    viewCount = json['view_count'];
    answerCount = json['answer_count'];
    score = json['score'];
    lastActivityDate = json['last_activity_date'];
    creationDate = json['creation_date'];
    questionId = json['question_id'];
    link = json['link'];
    title = json['title'];
    acceptedAnswerId = json['accepted_answer_id'];
    protectedDate = json['protected_date'];
    lastEditDate = json['last_edit_date'];
  }
}
