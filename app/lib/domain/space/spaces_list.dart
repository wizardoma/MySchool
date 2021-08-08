import 'dart:math';

import 'package:app/domain/event/events_list.dart';
import '../post/post.dart';
import 'package:app/domain/question/question.dart';
import 'package:app/domain/space/space.dart';
import 'package:app/domain/user/user.dart';

final List<Space> spacesList = [
  cscSpace,
  eeSpace,
  pharmacySpace,
  medicineSpace
];

final Space cscSpace = Space(
  imageUrl:
      "https://images.unsplash.com/photo-1617240016072-d92174e44171?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y29tcHV0ZXIlMjBzY2llbmNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
  spaceName: "Computer Science",
  description:
      "Computer Science official space for students. Post and ask questions related to computer science",
  noOfFollowers: Random().nextInt(2000),
  events: eventsList,
  noOfPostsInAWeek: 6,
  posts: List.generate(Random().nextInt(20), (index) => Post.Random()),
  users: List.generate(Random().nextInt(200), (index) => User.Random()),
  questions: List.generate(Random().nextInt(20), (index) => Question.Random()),
);

final Space eeSpace = Space(
  imageUrl:
      "https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZWxlY3Ryb25pY3N8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60",
  spaceName: "Electrical and Electronics Engineering",
  events: eventsList,

  description:
      "Official Space for electrical and electronics engineers. Post and ask questions related to Electrical and Electronic Engineering",
  noOfFollowers: Random().nextInt(2000),
  noOfPostsInAWeek: 6,
  posts: List.generate(Random().nextInt(20), (index) => Post.Random()),
  users: List.generate(Random().nextInt(200), (index) => User.Random()),
  questions: List.generate(Random().nextInt(20), (index) => Question.Random()),
);

final Space pharmacySpace = Space(
  imageUrl:
      "https://images.unsplash.com/photo-1584362917165-526a968579e8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhhcm1hY3l8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  spaceName: "Pharmacy",
  events: eventsList,

  description:
      "Official Space for pharmacists. Post and ask questions related to Pharmacy",
  noOfFollowers: Random().nextInt(2000),
  noOfPostsInAWeek: 6,
  posts: List.generate(Random().nextInt(20), (index) => Post.Random()),
  users: List.generate(Random().nextInt(200), (index) => User.Random()),
  questions: List.generate(Random().nextInt(20), (index) => Question.Random()),
);

final Space medicineSpace = Space(
  imageUrl:
      "https://images.unsplash.com/photo-1585435557343-3b092031a831?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cGhhcm1hY3l8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  spaceName: "Medical Science",
  events: eventsList,

  description:
      "Official Space for Medical Students. Post and ask questions related to Medicine",
  noOfFollowers: Random().nextInt(2000),
  noOfPostsInAWeek: 6,
  posts: List.generate(Random().nextInt(20), (index) => Post.Random()),
  users: List.generate(Random().nextInt(200), (index) => User.Random()),
  questions: List.generate(Random().nextInt(20), (index) => Question.Random()),
);
//final List<String> spacesList = [
//  "Computer Science",
//  "Electrical and Electronics Engineering",
//  "Pharmacy",
//  "Medical Science",
//  "Mechatronics",
//  "MicroBiology",
//  "Agricultural Engineering",
//  "Chemistry",
//  "Physics",
//  "Political Science",
//  "Architecture",
//];
