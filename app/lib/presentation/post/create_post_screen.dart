import 'package:app/application/post/create_post_request.dart';
import 'package:app/application/post/post_crud_cubit.dart';
import 'package:app/application/post/post_state.dart';
import 'package:app/application/user/user_bloc.dart';
import 'package:app/application/user/user_state.dart';
import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/user/user.dart';
import 'package:app/presentation/widgets/post_bottom_sheet.dart';
import 'package:app/presentation/widgets/post_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  User _currentUser;
  TextEditingController _titleController;
  TextEditingController _bodyController;
  static List<String> _postTypeOptions = ["Create Post", "Add a question"];
  int _postTypeIndex = 0;
  var _postType = _postTypeOptions[0];
  String _postTitleHint = "Your post topic";
  String _postHintText =
      "Post about studies, your activities, useful academic insights etc.";
  String _questionHintText =
      "Start your question with \"What\", \"Why\", \"How\", etc. ";

  @override
  void initState() {
    _currentUser = (context.read<UserBloc>().state as FetchedUserState).user;
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<PostCrudCubit, PostState>(
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: PostBottomSheet(
              headerTitle: DropdownButton(
                iconSize: 30,
                underline: SizedBox(),
                iconEnabledColor: Colors.grey,
                hint: Text(_postType),
                onChanged: (s) {
                  setState(() {
                    _postType = s.toString();
                    _postTypeIndex = _postTypeOptions.indexOf(_postType);
                  });
                },
                items: _postTypeOptions
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
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
                        onTap: _createPost,
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
              body: Container(
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
                          "${_currentUser.name} ${!isPost() ? "Asked" : "Posted"}",
                          style: kSubtitleTextStyle.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                    kVerticalSpaceMedium,
                    TextField(
                      controller: _titleController,
                      minLines: 1,
                      maxLines: 2,
                      decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                          hintText:
                              isPost() ? _postTitleHint : _questionHintText,
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
                    kVerticalSpaceRegular,
                    if (_postTypeIndex == 0)
                      TextField(
                        controller: _bodyController,
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
          );
        },
        listener: (BuildContext context, state) {
          if (state is PostCreateSuccess) {
            _showSnackBar("Your post was created successfully");
            Future.delayed(Duration(seconds: 1), () {
              Navigator.popAndPushNamed(context, PostViewScreen.routeName,
                  arguments: {"post": state.post});
            });
          }
          if (state is PostCreateFailureState) {
            _showSnackBar(state.errorMessage);
          }
        },
      ),
    );
  }

  bool isPost() {
    return _postTypeOptions.indexOf(_postType) == 0;
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

  void _createPost() {
    var postRequest = CreatePostRequest(
      userId: _currentUser.id,
      title: _titleController.text,
      body: _bodyController?.text,
      type: _postTypeIndex == 1 ? "question" : "post",
    );

    context.read<PostCrudCubit>().createPost(postRequest);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }
}
