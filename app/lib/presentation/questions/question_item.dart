import 'dart:math';

import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/posts/post.dart';
import 'package:app/presentation/questions/question_answer_screen.dart';
import 'package:flutter/material.dart';

class QuestionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        QuestionAnswerScreen.routeName,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Asked in Computer Science"),
                  CloseButton(),
                ],
              ),
            ),
            kVerticalSpaceSmall,
            Container(
              child: Text(
                mathPostTitles[Random().nextInt(mathPostTitles.length)],
                style: kPostTitleTextStyle,
              ),
            ),
            kVerticalSpaceSmall,
            Text(
              "1 answer",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54),
            ),
            kVerticalSpaceSmall,
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.post_add,
                                color: Colors.blue,
                              ),
                              Text("Answer")
                            ],
                          ),
                        ),
                        kHorizontalSpaceSmall,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.waves,
                              color: Colors.black54,
                            ),
                            kHorizontalSpaceTiny,
                            Text("Follow"),
                          ],
                        ),
                        kHorizontalSpaceSmall,
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.share,
                              color: Colors.black54,
                            )),
                        kHorizontalSpaceTiny,
                        IconButton(
                            onPressed: () => null,
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.black54,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
