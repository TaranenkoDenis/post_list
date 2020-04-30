class QuestionOwner {
  int reputation;
  int userId;
  String userType;
  String profileImage;
  String displayName;
  String link;
  int acceptRate;

  QuestionOwner(
      {this.reputation,
      this.userId,
      this.userType,
      this.profileImage,
      this.displayName,
      this.link,
      this.acceptRate});

  QuestionOwner.fromJson(Map<String, dynamic> json) {
    reputation = json['reputation'];
    userId = json['user_id'];
    userType = json['user_type'];
    profileImage = json['profile_image'];
    displayName = json['display_name'];
    link = json['link'];
    acceptRate = json['accept_rate'];
  }
}
