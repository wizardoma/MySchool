import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:flutter/material.dart';

class DraftScreen extends StatelessWidget {
  static String routeName = "/drafts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black87,),
        leadingWidth: 30,
        backgroundColor: Colors.white,
        title: Text("Drafts", style: kPostTitleTextStyle,),
      ),
      body: Container(
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
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Text(
                "See Questions for you",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
