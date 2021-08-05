class Department {
  final String name;
  final int id;

  Department({this.name, this.id});

  factory Department.fromServer(dynamic data) {
    return Department(
      name: data["name"],
      id: data["id"],
    );
  }

  @override
  String toString() {
    return 'Department{name: $name, id: $id}';
  }
}
