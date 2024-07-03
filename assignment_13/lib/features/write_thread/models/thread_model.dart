class ThreadModel {
  final String id;
  final String content;
  final List<String> images;
  final String creatorUid;
  final String creator;
  final int liked;
  final int createdAt;
  final List<Map<String, dynamic>> replies;

  ThreadModel({
    required this.id,
    required this.content,
    required this.images,
    required this.creatorUid,
    required this.creator,
    required this.createdAt,
    required this.liked,
    required this.replies,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "content": content,
      "images": images,
      "creatorUid": creatorUid,
      "creator": creator,
      "createdAt": createdAt,
      "liked": liked,
      "replies": replies,
    };
  }

  ThreadModel.fromJson({required Map<String, dynamic> json})
      : id = json["id"],
        content = json["content"],
        images = List<String>.from(json["images"]),
        creatorUid = json["creatorUid"],
        creator = json["creator"],
        createdAt = json["createdAt"],
        liked = json["liked"],
        replies = List<Map<String, dynamic>>.from(json["replies"]);
}
