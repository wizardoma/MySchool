import 'package:app/application/question/question_bloc.dart';
import 'package:app/application/question/question_state.dart';
import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/post/post.dart';
import 'package:app/domain/question/question.dart';
import 'package:app/presentation/questions/question_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionScreen extends StatefulWidget {
  static const title = "Questions";

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  QuestionCubit _questionCubit;

  @override
  void initState() {
    _questionCubit = context.read<QuestionCubit>()..fetchQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        child: Builder(
          builder: (context) => Column(children: [
            TabBar(
              tabs: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: defaultSpacing * 0.5,
                      horizontal: defaultSpacing * 0.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.post_add,
                        color: Colors.black87,
                      ),
                      kHorizontalSpaceSmall,
                      Text(
                        "For You",
                        style: kPostTitleTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.download,
                        color: Colors.black87,
                      ),
                      kHorizontalSpaceSmall,
                      Text(
                        "Answer Later",
                        style: kPostTitleTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                ListView(shrinkWrap: true, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kVerticalSpaceSmall,
                      Container(
                        padding: EdgeInsets.all(defaultSpacing),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/question_mark.png",
                              width: 20,
                              height: 20,
                            ),
                            kHorizontalSpaceTiny,
                            Text("Questions for you"),
                          ],
                        ),
                      ),
                      Divider(),
                      BlocBuilder<QuestionCubit, QuestionState>(
                        // ignore: missing_return
                        builder: (context, state) {
                          if (state is QuestionLoadingState ||
                              state is QuestionUnInitializedState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is QuestionFetchErrorState) {
                            return Center(
                              child: Text(state.errorMessage),
                            );
                          }
                          if (state is QuestionFetchedState) {
                            List<Post> questions = state.posts;
                            return ListView.separated(
                              separatorBuilder: (c, i) => Divider(
                                thickness: 4,
                                color: Colors.grey.shade200,
                              ),
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: questions?.length ?? 0,
//                            crossAxisAlignment: CrossAxisAlignment.start,
                              itemBuilder: (ctx, index) => QuestionItem(
                                question: questions[index],
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ]),
                Container(
                  height: double.infinity,
                  color: Colors.grey.shade300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/mailbox_opened_flag_up.png",
                        width: 200,
                        height: 200,
                      ),
                      kVerticalSpaceSmall,
                      Text(
                        "No Answer Drafts",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                      kVerticalSpaceSmall,
                      Text(
                        "Start writing answers by finding questions to answer in Questions for You.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      kVerticalSpaceMedium,
                      Container(
                        padding: EdgeInsets.all(defaultSpacing),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "See Questions for you",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            )
          ]),
        ),
        initialIndex: 0,
        length: 2,
      ),
    );
  }
}
