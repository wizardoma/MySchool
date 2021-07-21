import 'dart:math';

import 'package:app/domain/posts/post.dart';
import 'package:app/domain/question/question.dart';
import 'package:app/domain/space/space.dart';

final List<Space> spacesList = [cscSpace, eeSpace];

final Space cscSpace = Space(
  spaceName: "Computer Science",
  about:
      "Computer Science official space for students. Post and ask questions related to computer science",
  noOfFollowers: Random().nextInt(2000),
  noOfPostsInAWeek: 6,
  posts: List.generate(Random().nextInt(20), (index) => Post.Random()),
  questions: List.generate(Random().nextInt(20), (index) => Question.Random()),
);

final Space eeSpace = Space(
  spaceName: "Electrical and Electronics Engineering",
  about:
      "Official Space for electrical and electronics engineers. Post and ask questions related to Electrical and Electronic Engineering",
  noOfFollowers: Random().nextInt(2000),
  noOfPostsInAWeek: 6,
  posts: List.generate(Random().nextInt(20), (index) => Post.Random()),
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
