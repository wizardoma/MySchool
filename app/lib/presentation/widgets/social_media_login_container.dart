import 'package:flutter/material.dart';

class SocialMediaLoginContainer extends StatelessWidget {
  final String asset;
  final String title;

  SocialMediaLoginContainer(this.asset, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
//        contentPadding: EdgeInsets.all(8),
        leading: Image.asset(
          asset,
          width: 30,
          height: 30,
        ),
        title: Text(title),
        tileColor: Colors.white,
      ),
    );
  }
}
