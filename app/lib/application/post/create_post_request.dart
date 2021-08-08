class CreatePostRequest {
  final String userId;
  final String title;
  final String spaceId;
  final String body;
  final String type;

  CreatePostRequest({this.userId, this.title, this.spaceId, this.body, this.type});

  factory CreatePostRequest.fromMap(Map<String, dynamic> map) {
    return new CreatePostRequest(
      userId: map['userId'] as String,
      title: map['title'] as String,
      spaceId: map['spaceId'] as String,
      body: map['body'] as String,
      type: map['type'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'userId': this.userId,
      'title': this.title,
      'spaceId': this.spaceId,
      'body': this.body,
      'type': this.type,
    } as Map<String, dynamic>;
  }
}