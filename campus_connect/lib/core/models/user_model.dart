class UserModel {
  String? fullName;
  String? username;
  String? phone;
  String? profileUrl;
  String? university;
  String? department;
  String? level;
  String? uid;
  String? createdAt;

  UserModel(
      {this.fullName,
      this.username,
      this.phone,
      this.profileUrl,
      this.university,
      this.department,
      this.level,
      this.uid,
      this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.fullName = json["fullName"];
    this.username = json["username"];
    this.phone = json["phone"];
    this.profileUrl = json["profileUrl"];
    this.university = json["university"];
    this.department = json["department"];
    this.level = json["level"];
    this.uid = json["uid"];
    this.createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["fullName"] = this.fullName;
    data["username"] = this.username;
    data["phone"] = this.phone;
    data["profileUrl"] = this.profileUrl;
    data["university"] = this.university;
    data["department"] = this.department;
    data["level"] = this.level;
    data["uid"] = this.uid;
    data["created_at"] = this.createdAt;
    return data;
  }
}
