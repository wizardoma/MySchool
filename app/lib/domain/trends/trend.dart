import 'dart:math';

import 'package:flutter/foundation.dart';

class Trend {
  final String trendName;
  final String spaceName;
  final int noOfTopics;

  Trend({
    @required this.trendName,
    @required this.spaceName,
    @required this.noOfTopics,
  });
}

List<Trend> trendsList = [
  Trend(
    trendName: "Data Structures and Algorithms",
    spaceName: "Computer Science",
    noOfTopics: Random().nextInt(2000),
  ),
  Trend(
    trendName: "Solar Activities",
    spaceName: "Physics",
    noOfTopics: Random().nextInt(2000),
  ),
  Trend(
    trendName: "Ionization Energy",
    spaceName: "Chemistry",
    noOfTopics: Random().nextInt(2000),
  ),
  Trend(
    trendName: "sql",
    spaceName: "Statistics",
    noOfTopics: Random().nextInt(2000),
  ),
  Trend(
    trendName: "Internet of Things",
    spaceName: "Agriculture",
    noOfTopics: Random().nextInt(2000),
  ),
  Trend(
    trendName: "Blockchain",
    spaceName: "Security",
    noOfTopics: Random().nextInt(2000),
  ),
];
