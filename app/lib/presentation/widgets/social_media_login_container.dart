import 'package:flutter/material.dart';

class SocialMediaLoginContainer extends StatelessWidget {
  final String image;
  final String title;
  final Function onTap;

  SocialMediaLoginContainer({this.image, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: onTap,
//        contentPadding: EdgeInsets.all(8),
        leading: Image.asset(
          image,
          width: 30,
          height: 30,
        ),
        title: Text(title),
        tileColor: Colors.white,
      ),
    );
  }
}
