class CreateCommentRequest {
  final String body;
  final String userId;

  CreateCommentRequest({this.body, this.userId});

  factory CreateCommentRequest.fromMap(Map<String, dynamic> map) {
    return new CreateCommentRequest(
      body: map['body'] as String,
      userId: map['userId'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'body': this.body,
      'userId': this.userId,
    } as Map<String, dynamic>;
  }
}