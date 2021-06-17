import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalAuthContainer extends StatelessWidget {
  final Function onTap;
  final String title;

  const LocalAuthContainer({Key key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade600,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
