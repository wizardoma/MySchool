import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/post/post.dart';
import 'package:app/domain/question/question.dart';
import 'package:app/presentation/questions/answer_question_sheet.dart';
import 'package:app/presentation/questions/question_answer_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionItem extends StatelessWidget {
  final Post question;
  final Function onAnswerQuestion;

  const QuestionItem({Key key, this.question, this.onAnswerQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, QuestionAnswerScreen.routeName,
          arguments: {"question": question}),
      child: Padding(
        padding: const EdgeInsets.all(defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Asked ${question.space == null ? " by ${question.user.name}" : " in ${question.space.spaceName}"}"),
                  CloseButton(),
                ],
              ),
            ),
            kVerticalSpaceSmall,
            Container(
              child: Text(
                question.title,
                style: kPostTitleTextStyle,
              ),
            ),
            kVerticalSpaceSmall,
            Text(
              "${question.noOfComments} answer(s)",
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
                        GestureDetector(
                          onTap: onAnswerQuestion,
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.post_add,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text("Answer")
                              ],
                            ),
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
