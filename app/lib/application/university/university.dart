import 'package:app/application/university/department.dart';

class University {
  final int id;
  final String shortName;
  final String fullName;
  final List<Department> department;

  University({this.id, this.shortName, this.fullName, this.department});

  factory University.fromServer(dynamic data) {
    return University(
      id: data["id"],
      shortName: data["shortName"],
      fullName: data["fullName"],
    );
  }

  @override
  String toString() {
    return 'University{id: $id, shortName: $shortName, fullName: $fullName, department: $department}';
  }
}
