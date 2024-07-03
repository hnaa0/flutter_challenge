class UserProfileModel {
  final String uid;
  final String contact;
  final String name;
  final String bio;
  final bool isCertified;
  // final bool hasAvatar;

  UserProfileModel({
    required this.uid,
    required this.contact,
    required this.name,
    required this.bio,
    required this.isCertified,
    // required this.hasAvatar,
  });

  UserProfileModel.empty()
      : uid = "",
        contact = "",
        name = "",
        bio = "",
        isCertified = false;
  // hasAvatar = false;

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "contact": contact,
      "name": name,
      "bio": bio,
      "isCertified": isCertified,
    };
  }

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        contact = json["contact"],
        name = json["name"],
        bio = json["bio"],
        isCertified = json["isCertified"];
}
