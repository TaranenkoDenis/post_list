import 'package:stackoverflow_client/data/models/tag.dart';

class TagsResponse {
  List<Tag> items;
  bool hasMore;
  int quotaMax;
  int quotaRemaining;

  TagsResponse({this.items, this.hasMore, this.quotaMax, this.quotaRemaining});

  TagsResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Tag>[];
      json['items'].forEach((v) {
        items.add(Tag.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    quotaMax = json['quota_max'];
    quotaRemaining = json['quota_remaining'];
  }
}
