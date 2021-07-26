import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/question/answer.dart';
import 'package:app/domain/question/question.dart';
import 'package:app/presentation/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnswerContainer extends StatelessWidget {
  final Answer answer;

  const AnswerContainer({Key key, this.answer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kVerticalSpaceSmall,
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpacing * 0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, ProfileScreen.routeName, arguments: {"user": answer.user}),
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
                                            "assets/icons/student.png"),
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
                                            answer.user.name,
                                            style: kAuthorNameStyle,
                                          ),
                                          kHorizontalSpaceSmall,
                                        ],
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              answer.user.department,
                                              style: kSubtitleTextStyle,
                                            ),
                                            Text(
                                              "Answered"+DateFormat(' MMM d, y')
                                                  .format(answer.date),
                                              style: kSubtitleTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    kVerticalSpaceTiny,
                    Container(
                      padding: EdgeInsets.all(defaultSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            answer.answer,
                            style: TextStyle(height: 1.3),
                          ),
                          kVerticalSpaceMedium,
                          Text(answer.noOfViews.toString() + " views", style: kSubtitleTextStyle,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kVerticalSpaceSmall,

            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultSpacing * 0.5),
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
                        EdgeInsets.symmetric(horizontal: defaultSpacing * 0.5, vertical: defaultSpacing * 0.2),
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
                          Text(answer.noOfShares.toString()),
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
                          Text(answer.noOfComments.toString()),
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
                          onPressed: (){},
                          icon: Icon(
                            Icons.share,
                            color: Colors.black54,
                          )),
                      kHorizontalSpaceTiny,
                      IconButton(
                          onPressed: () => {},
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
