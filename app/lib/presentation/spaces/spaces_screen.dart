import 'package:app/commons/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpacesScreen extends StatefulWidget {
  static const title = "Spaces";
  SpacesScreen({Key key}) : super(key: key);

  @override
  _SpacesScreenState createState() => _SpacesScreenState();
}

class _SpacesScreenState extends State<SpacesScreen> {
  final List<String> _spaces = [
    "Computer Science",
    "Electrical and Electronics Engineering"
    ,
    "Pharmacy",
    "Medical Science",
    "Mechatronics",
    "MicroBiology",
    "Agricultural Engineering",
    "Chemistry","Physics",
    "Political Science",
    "Architecture",

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Your Spaces", style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                kVerticalSpaceSmall,
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue)
                            ),
                            child: Icon(Icons.add, color: Colors.blue, ),
                          ),
                          kHorizontalSpaceTiny,
                          Text("Create", style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                    ),
                    kHorizontalSpaceMedium,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.blue)
                            ),
                            child: Icon(Icons.search, color: Colors.blue, ),
                          ),
                          kHorizontalSpaceTiny,
                          Text("Discover", style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                    ),


                  ],
                )
              ],
            ),
          ),
          kVerticalSpaceSmall,
          Expanded(
            child: ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: _spaces.map((space) => ListTile(
                leading: Image.asset("assets/images/group_task.png", width:20, height:20),
                title: Text(space, style: TextStyle(
                  fontWeight: FontWeight.bold,

                ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}