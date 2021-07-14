import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/posts/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  final Post post;
  final Function onPostTap;
  final Function onPostLike;
  final Function onPostShare;
  final Function onPostComment;
  final Function onPostDismiss;

  const PostView(
      {Key key,
      this.post,
      this.onPostTap,
      this.onPostLike,
      this.onPostShare,
      this.onPostComment,
      this.onPostDismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                                      "Asma Hadad",
                                      style: kAuthorNameStyle,
                                    ),
                                    kHorizontalSpaceSmall,
                                    Text(
                                      "Follow",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Text("April 16"),
                              ],
                            )
                          ],
                        ),
                      ),
                      CloseButton(
                        onPressed: onPostDismiss,
                      ),
                    ],
                  ),
                ),
                kVerticalSpaceTiny,
                Container(
                  child: Text(
                    post.title,
                    style: kPostTitleTextStyle,
                  ),
                ),
                kVerticalSpaceSmall,
                Container(
                  child: Text(
                    post.body,
                    maxLines: 2,
                  ),
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
                    image: NetworkImage(post.imageUrl), fit: BoxFit.cover)),
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
                          Text(post.noOfShares.toString()),
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
                          Text(post.noOfComments.toString()),
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
                          onPressed: onPostShare,
                          icon: Icon(
                            Icons.share,
                            color: Colors.black54,
                          )),
                      kHorizontalSpaceTiny,
                      IconButton(
                          onPressed: null,
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
}
