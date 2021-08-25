class TweetModel {
  bool? hasImage;
  int? likesCount;
  int? retweetCount;
  String? timeStamp;
  String? tweetImageUrl;
  String? tweeterProfileUrl;
  String? tweeterUsername;
  String? tweet;
  String? uid;

  TweetModel(
      {this.hasImage,
      this.likesCount,
      this.retweetCount,
      this.timeStamp,
      this.tweet,
      this.tweetImageUrl,
      this.tweeterProfileUrl,
      this.uid,
      this.tweeterUsername});

  TweetModel.fromJson(Map<String, dynamic> json, String uid) {
    this.uid = uid;
    this.hasImage = json["hasImage"];
    this.likesCount = json["likesCount"];
    this.retweetCount = json["retweetCount"];
    this.timeStamp = json["timeStamp"];
    this.tweetImageUrl = json["tweetImageUrl"];
    this.tweeterProfileUrl = json["tweeterProfileUrl"];
    this.tweeterUsername = json["tweeterUsername"];
    this.tweet = json["tweet"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["hasImage"] = this.hasImage;
    data["likesCount"] = this.likesCount;
    data["retweetCount"] = this.retweetCount;
    data["timeStamp"] = this.timeStamp;
    data["tweetImageUrl"] = this.tweetImageUrl;
    data["tweeterProfileUrl"] = this.tweeterProfileUrl;
    data["tweeterUsername"] = this.tweeterUsername;
    data["tweet"] = this.tweet;
    return data;
  }
}
