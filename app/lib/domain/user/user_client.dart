import 'package:app/domain/user/user.dart';

class UserClient {
  static final User currentUser = User(
    id: "sfsff",
    email: "alibeson@gmail.com",
    department: "Computer science",
    university: "futo",
    level: "500L",
  );

  List<User> users = [
    currentUser,
    ...List.generate(
        10,
        (index) => User(
            id: "$index hellow",
            name: "name of you",
            department: "EEE",
            university: "futo",
            email: "Bla bla bla"))
  ];
}
