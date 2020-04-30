import 'package:stackoverflow_client/data/models/question.dart';

class QuestionsResponse {
  List<Question> items;
  bool hasMore;
  int quotaMax;
  int quotaRemaining;

  QuestionsResponse(
      {this.items, this.hasMore, this.quotaMax, this.quotaRemaining});

  QuestionsResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Question>[];
      json['items'].forEach((v) {
        items.add(Question.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    quotaMax = json['quota_max'];
    quotaRemaining = json['quota_remaining'];
  }
}
