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
    "Electrical and Electronics Engineering",
    "Pharmacy",
    "Medical Science",
    "Mechatronics",
    "MicroBiology",
    "Agricultural Engineering",
    "Chemistry",
    "Physics",
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
                  child: Text(
                    "Your Spaces",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                kVerticalSpaceSmall,
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                border: Border.all(color: Colors.blue)),
                            child: Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.blue,
                            ),
                          ),
                          kHorizontalSpaceTiny,
                          Text(
                            "Create",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    kHorizontalSpaceSmall,
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                border: Border.all(color: Colors.blue)),
                            child: Icon(
                              Icons.search,
                              size: 15,
                              color: Colors.blue,
                            ),
                          ),
                          kHorizontalSpaceTiny,
                          Text(
                            "Discover",
                            style: TextStyle(color: Colors.blue),
                          )
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
            child: ListView.separated(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(color: Colors.grey.shade200, thickness: 0.5,),
              itemBuilder: (context, index)=>  CustomListTile(
                        leading: Image.asset("assets/images/group_task.png",
                            width: 20, height: 20),
                        title: Text(
                          _spaces[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ), itemCount: _spaces.length,)
                  ,
            ),
          ]
      )


    );
  }
}

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final Widget title;

  const CustomListTile({Key key, this.leading, this.trailing, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                leading,
                kHorizontalSpaceSmall,
                title,
              ],
            ),
          ),
          Container(
            child: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey,),
          ),

        ],
      ),
    );
  }
}

