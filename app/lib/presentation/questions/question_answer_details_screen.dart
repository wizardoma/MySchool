import 'package:app/application/post/post_state.dart';
import 'package:app/application/post/posts_bloc.dart';
import 'package:app/application/post/posts_event.dart';
import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/post/post.dart';
import 'package:app/presentation/questions/answer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      BlocProvider.of<PostBloc>(context)
          .add(FetchSinglePostEvent(_question.id));
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
      body: BlocBuilder<PostBloc, PostState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is PostLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostSingleFetchErrorState) {
            return Center(
              child: Text("An error occurred fetching post"),
            );
          }
          if (state is PostSingleFetchedState) {
            Post post = state.post;
            return Container(
              child: Column(
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
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                                "Asked ${post.space == null ? " by ${post.user.name}" : " in ${post.space.spaceName}"}"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: post.comments.length == 0
                            ? Center(
                                child: Text("No Answers yet"),
                              )
                            : ListView.separated(
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.grey.shade200,
                                  thickness: 4,
                                ),
                                itemCount: post.comments.length,
                                itemBuilder: (context, index) {
                                  return AnswerContainer(
                                    answer: post.comments[index],
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
        },
      ),
    );
  }
}
