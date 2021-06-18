import 'package:flutter/material.dart';

class FormBottomSheet extends StatelessWidget {
  final String title;
  final Function onButtonPressed;
  final Widget form;

  const FormBottomSheet({Key key, this.title, this.onButtonPressed, this.form})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: CloseButton(
            color: Theme.of(context).primaryColor,
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 1,
          title: Text(
            title,
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Myschool",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w800)),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: kToolbarHeight,
                  child: Text(
                    "$title for MySchool",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
//                  height: mQ.size.height * 0.6,
//                  padding: EdgeInsets.only(bottom: mQ.viewInsets.bottom),
                  child: form,
                ),
              ],
            ),
          ),
        ));
  }
}
