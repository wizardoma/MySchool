import 'package:app/commons/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mqHeight = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.all(15),
        height: mqHeight * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: mqHeight * 0.3 * 0.6,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.shade300,
                                Colors.grey.shade100
                              ],
                            ),
                            child: Container(
                              height: 20,
                              color: Colors.grey,
                            ),
                          ),
                          kVerticalSpaceSmall,
                          Shimmer(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.shade300,
                                Colors.grey.shade100
                              ],
                            ),
                            child: Container(
                              height: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    kVerticalSpaceSmall,
                    Container(
                      child: ListTile(
                        leading: Shimmer(
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.shade300,
                              Colors.grey.shade100
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 30,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Shimmer(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.grey.shade300,
                                        Colors.grey.shade100
                                      ],
                                    ),
                                    child: Container(
                                      height: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  kVerticalSpaceSmall,
                                  Shimmer(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.grey.shade300,
                                        Colors.grey.shade100
                                      ],
                                    ),
                                    child: Container(
                                      height: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            Spacer()
          ],
        ));
  }
}
