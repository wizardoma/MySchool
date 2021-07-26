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
      child: ListTile(
        onTap: onTap,
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
