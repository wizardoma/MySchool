import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/posts/post.dart';
import 'package:app/domain/question/question.dart';
import 'package:app/presentation/questions/answer_container.dart';
import 'package:app/presentation/widgets/post_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionAnswerScreen extends StatefulWidget {
  static const routeName = "question-answer";

  @override
  _QuestionAnswerScreenState createState() => _QuestionAnswerScreenState();
}

class _QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  var hasRun = false;
  Question _question;

  @override
  void didChangeDependencies() {
    if (!hasRun) {
      dynamic arguments = ModalRoute.of(context).settings.arguments;
      print("Args $arguments");
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
            padding: EdgeInsets.all(15),
            child: Text(
              _question.question,
              style: kPostTitleTextStyle.copyWith(fontSize: 25),
            ),
          ),
          kVerticalSpaceSmall,
          Expanded(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_question.answers.length} Answer(s)",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Asked in ${_question.spaceName}",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade200,
                    thickness: 4,
                  ),
                  itemCount: _question.answers.length,
                  itemBuilder: (context, index) {
                    return AnswerContainer(
                      answer: _question.answers[index],
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
