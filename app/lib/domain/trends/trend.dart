import 'dart:math';

import 'package:app/domain/space/space.dart';
import 'package:app/domain/space/spaces_list.dart';
import 'package:flutter/foundation.dart';

class Trend {
  final String trendName;
  final Space space;
  final int noOfTopics;

  Trend({
    @required this.trendName,
    @required this.space,
    @required this.noOfTopics,
  });
}

List<Trend> trendsList = [
  Trend(
    trendName: "Data Structures and Algorithms",
    space: spacesList[0],
    noOfTopics: Random().nextInt(2000),
  ),
  Trend(
    trendName: "Smart Grids",
    space: spacesList[1],
    noOfTopics: Random().nextInt(2000),
  ),
  Trend(
    trendName: "Covid 19",
    space: spacesList[2],
    noOfTopics: Random().nextInt(2000),
  ),
  Trend(
    trendName: "sql",
    space: spacesList[0],
    noOfTopics: Random().nextInt(2000),
  ),
  Trend(
    trendName: "Internet of Things",
    space: spacesList[0],
    noOfTopics: Random().nextInt(2000),
  ),
  Trend(
    trendName: "Blockchain Opportunities in HealthCare",
    space: spacesList[3],
    noOfTopics: Random().nextInt(2000),
  ),
];
