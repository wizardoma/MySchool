import 'package:app/application/post/create_comment_request.dart';
import 'package:app/application/post/create_post_request.dart';
import 'package:app/application/post/post_crud_cubit.dart';
import 'package:app/application/post/post_state.dart';
import 'package:app/application/user/user_bloc.dart';
import 'package:app/application/user/user_state.dart';
import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/post/post.dart';
import 'package:app/domain/user/user.dart';
import 'package:app/presentation/questions/question_answer_details_screen.dart';
import 'package:app/presentation/widgets/post_bottom_sheet.dart';
import 'package:app/presentation/widgets/post_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerQuestionSheet extends StatefulWidget {
  final Post question;

  const AnswerQuestionSheet({Key key, this.question}) : super(key: key);

  @override
  _AnswerQuestionSheetState createState() => _AnswerQuestionSheetState();
}

class _AnswerQuestionSheetState extends State<AnswerQuestionSheet> {
  User _currentUser;
  TextEditingController _answerController;
  String _postHintText = "Write your answer";

  @override
  void initState() {
    _currentUser = (context.read<UserBloc>().state as FetchedUserState).user;
    _answerController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCrudCubit, PostState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.95,
          child: PostBottomSheet(
            headerTitle: Container(),
            button: state is PostLoadingState
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Container(
                    child: GestureDetector(
                      onTap: _answerQuestion,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(defaultSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              AssetImage("assets/icons/student.png"),
                        ),
                        kHorizontalSpaceTiny,
                        Text(
                          "${_currentUser.name} Answered",
                          style: kSubtitleTextStyle.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                    kVerticalSpaceMedium,
                    Text(
                      widget.question.title,
                      style: kPostTitleTextStyle,
                    ),
                    kVerticalSpaceRegular,
                    TextField(
                      controller: _answerController,
                      minLines: 2,
                      maxLines: 10,
                      decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                          hintText: _postHintText,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, state) {
        if (state is PostCommentAddedSuccessState) {
          print("created comment from server ${state.comment}");
          _showSnackBar("Your comment was created successfully");
          Future.delayed(Duration(seconds: 1), () {
            Navigator.popAndPushNamed(context, QuestionAnswerScreen.routeName,
                arguments: {"question": widget.question});
          });
        }
        if (state is PostCommentAddedFailureState) {
          _showSnackBar(state.errorMessage);
        }
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Padding(
            padding: EdgeInsets.all(8),
            child: Text(message),
          ),
        ),
      );
  }

  void _answerQuestion() {
    context.read<PostCrudCubit>().addComment(
          widget.question.id,
          CreateCommentRequest(
            userId: _currentUser.id,
            body: _answerController.text,
          ),
        );
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }
}
