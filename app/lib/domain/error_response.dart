class ErrorResponse {
  final String id;
  final String message;
  final String url;

  ErrorResponse({ this.id, this.message, this.url = ""});

  @override
  String toString() {
    return 'ErrorResponse{id: $id, message: $message, url: $url}';
  }
}