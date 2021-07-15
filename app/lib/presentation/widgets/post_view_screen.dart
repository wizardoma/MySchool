import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/posts/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostViewScreen extends StatefulWidget {
  static const routeName = "/post-view-screen";

  const PostViewScreen({Key key}) : super(key: key);

  @override
  _PostViewScreenState createState() => _PostViewScreenState();
}

class _PostViewScreenState extends State<PostViewScreen> {
  Function _onPostShare;
  Function _onPostOptionsTap;
  bool hasRun = false;
  Post _post;

  @override
  void didChangeDependencies() {
    if (!hasRun) {
      dynamic arguments = ModalRoute.of(context).settings.arguments;
      print("Args $arguments");
      _post = arguments["post"];
      _onPostShare = arguments["onPostShare"] ?? null;
      _onPostOptionsTap = arguments["onPostOptionsTap"] ?? null;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 15,
        leading: BackButton(

          color: Colors.black54,
        ),
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/icons/google.png"),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        _post.user.name,
                        style: kAuthorNameStyle.copyWith(color: Colors.black54),
                      ),
                      kHorizontalSpaceSmall,
                      Text(
                        "Follow",
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _post.user.university,
                        style: kSubtitleTextStyle,
                      ),
                      Text(
                        DateFormat('MMM d, y').format(_post.date),
                        style: kSubtitleTextStyle,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: ListView(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kVerticalSpaceSmall,
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              _post.title,
              style: kPostTitleTextStyle,
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(_post.imageUrl), fit: BoxFit.cover)),
          ),
          kVerticalSpaceSmall,
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              _post.body,
              style: TextStyle(height: 1.3),
            ),
          ),
          kVerticalSpaceSmall,
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_upward_outlined,
                          color: Colors.black54,
                        ),
                        Text("9.8K")
                      ],
                    ),
                  ),
                  kHorizontalSpaceSmall,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Colors.black54,
                      ),
                      kHorizontalSpaceTiny,
                      Text(_post.noOfShares.toString()),
                    ],
                  ),
                  kHorizontalSpaceSmall,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message_outlined,
                        color: Colors.black54,
                      ),
                      kHorizontalSpaceTiny,
                      Text(_post.noOfComments.toString()),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: _onPostShare,
                      icon: Icon(
                        Icons.share,
                        color: Colors.black54,
                      )),
                  kHorizontalSpaceTiny,
                  IconButton(
                      onPressed: () => _onPostOptionsTap(context),
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
    );
  }
}
