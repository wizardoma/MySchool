import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/post/post.dart';
import 'package:app/presentation/questions/answer_container.dart';
import 'package:flutter/material.dart';

class QuestionAnswerScreen extends StatefulWidget {
  static const routeName = "question-answer";

  @override
  _QuestionAnswerScreenState createState() => _QuestionAnswerScreenState();
}

class _QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  var hasRun = false;
  Post _question;

  @override
  void didChangeDependencies() {
    if (!hasRun) {
      dynamic arguments = ModalRoute.of(context).settings.arguments;
      _question = arguments["question"];
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
//        shadowColor: null,
        leading: BackButton(
          color: Colors.black87,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(defaultSpacing),
            child: Text(
              _question.title,
              style: kPostTitleTextStyle.copyWith(fontSize: 25),
            ),
          ),
          kVerticalSpaceSmall,
          Expanded(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: defaultSpacing * 0.5,
                    horizontal: defaultSpacing * 0.5),
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${0} Answer(s)",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "Asked ${_question.space == null ? " by ${_question.user.name}" : " in ${_question.space.spaceName}"}"),
                  ],
                ),
              ),
              Expanded(
                child: _question.comments.length == 0
                    ? Center(
                        child: Text("No Answers yet"),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey.shade200,
                          thickness: 4,
                        ),
                        itemCount: _question.comments.length,
                        itemBuilder: (context, index) {
                          return AnswerContainer(
                            answer: _question.comments[index],
                          );
                        },
                      ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
