class StoreProductModel {
  String? imageUrl;
  String? name;
  String? price;
  String? phone;
  String? timestamp;
  String? location;
  String? ownerUsername;
  String? uid;
  StoreProductModel({
    this.imageUrl,
    this.name,
    this.price,
    this.uid,
    this.phone,
    this.timestamp,
    this.location,
    this.ownerUsername,
  });

  StoreProductModel.fromJson(Map<String, dynamic> json, String uid) {
    this.imageUrl = json["imageUrl"];
    this.name = json["name"];
    this.uid = uid;
    this.price = json["price"];
    this.phone = json["phone"];
    this.timestamp = json["timestamp"];
    this.location = json["location"];
    this.ownerUsername = json["ownerUsername"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["imageUrl"] = this.imageUrl;
    data["name"] = this.name;
    data["price"] = this.price;
    data["phone"] = this.phone;
    data["timestamp"] = this.timestamp;
    data["location"] = this.location;
    data["ownerUsername"] = this.ownerUsername;
    return data;
  }
}
