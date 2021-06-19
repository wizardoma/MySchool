import 'package:app/domain/error_response.dart';

class ResponseEntity {
  final bool isError;
  final dynamic data;
  final ErrorResponse errors;

  const ResponseEntity(this.isError, this.data, this.errors);

  factory ResponseEntity.Error(dynamic errors){
    return ResponseEntity(true, null, ErrorResponse(message: errors));
  }

  factory ResponseEntity.Data(dynamic data){
    return ResponseEntity(false, data, null);
  }

  @override
  String toString() {
    return 'ResponseEntity{isError: $isError, data: $data, errors: $errors}';
  }
}