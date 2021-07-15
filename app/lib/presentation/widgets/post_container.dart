import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/posts/post.dart';
import 'package:app/presentation/widgets/post_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostContainer extends StatefulWidget {
  final Post post;

  const PostContainer({
    Key key,
    this.post,
  }) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  Function _onPostTap;
  Function _onPostLike;
  Function _onPostShare;

//  final Function onPostOptionsTap;
  Function _onPostComment;
  Function _onPostDismiss;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => openPost(context),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/icons/google.png"),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            widget.post.user.name,
                                            style: kAuthorNameStyle,
                                          ),
                                          kHorizontalSpaceSmall,
                                          Text(
                                            "Follow",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      LayoutBuilder(
                                        builder: (context, constraint) =>
                                            Container(
//                                         width: constraint.maxWidth,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.post.user.university,
                                                style: kSubtitleTextStyle,
                                              ),
                                              Text(
                                                DateFormat('MMM d, y')
                                                    .format(widget.post.date),
                                                style: kSubtitleTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            CloseButton(
                              onPressed: _onPostDismiss,
                            ),
                          ],
                        ),
                      ),
                      kVerticalSpaceTiny,
                      Container(
                        child: Text(
                          widget.post.title,
                          style: kPostTitleTextStyle,
                        ),
                      ),
                      kVerticalSpaceSmall,
                      Container(
                        height: 50,
                        child: Stack(children: [
                          Positioned.fill(
                            child: Text(
                              widget.post.body,
                              maxLines: 2,
                              style: TextStyle(height: 1.3),
                            ),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 8,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                color: Colors.white.withOpacity(0.7),
                                child: Text(
                                  "Read More",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ))
                        ]),
                      ),
                    ],
                  ),
                ),
                kVerticalSpaceSmall,
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.post.imageUrl),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          Container(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 3),
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
                          Text(widget.post.noOfShares.toString()),
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
                          Text(widget.post.noOfComments.toString()),
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
                          onPressed: () => onPostOptionsTap(context),
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
    );
  }

  void onPostOptionsTap(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () => print("on close"),
              builder: (context) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Text(
                            "Answer",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      bottomSheetItem("Thank"),
                      Divider(),
                      bottomSheetItem("Downvote Question"),
                      Divider(),
                      bottomSheetItem("Log"),
                      Divider(),
                      bottomSheetItem("Report"),
                    ],
                  ),
                );
              });
        });
  }

  void openPost(BuildContext context) {
    Navigator.pushNamed(context, PostViewScreen.routeName, arguments: {
      "post": widget.post,
      "onPostOptionsTap": (context) => onPostOptionsTap(context)
    });
  }

  Widget bottomSheetItem(String title) => Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: Text(title),
        ),
      );
}