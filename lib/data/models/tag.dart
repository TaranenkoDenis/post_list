class Tag {
  bool hasSynonyms;
  bool isModeratorOnly;
  bool isRequired;
  int count;
  String name;

  Tag(
      {this.hasSynonyms,
      this.isModeratorOnly,
      this.isRequired,
      this.count,
      this.name});

  Tag.fromJson(Map<String, dynamic> json) {
    hasSynonyms = json['has_synonyms'];
    isModeratorOnly = json['is_moderator_only'];
    isRequired = json['is_required'];
    count = json['count'];
    name = json['name'];
  }
}
