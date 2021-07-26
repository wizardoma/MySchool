
import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/question/question.dart';
import 'package:app/presentation/questions/question_answer_screen.dart';
import 'package:flutter/material.dart';

class QuestionItem extends StatelessWidget {
  final Question question;

  const QuestionItem({Key key, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        QuestionAnswerScreen.routeName,
        arguments: {"question": question}
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultSpacing * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Asked in ${question.spaceName}"),
                  CloseButton(),
                ],
              ),
            ),
            kVerticalSpaceSmall,
            Container(
              child: Text(
                question.question,
                style: kPostTitleTextStyle,
              ),
            ),
            kVerticalSpaceSmall,
            Text(
              "${question.answers.length} answer(s)",
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
