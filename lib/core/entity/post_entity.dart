class PostsModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  PostsModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostsModel.fromJosn(json) {
    return PostsModel(
      id: int.parse(json['id'].toString()),
      userId: int.parse(json['userId'].toString()),
      title: json['title'],
      body: json['body'],
    );
  }

  toJosn() {
    return {"userId": userId, "id": id, "title": title, "body": body};
  }
}
