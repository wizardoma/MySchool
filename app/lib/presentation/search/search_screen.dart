import 'package:app/commons/api.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/user/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/search";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController;
  Future<List<User>> _fetchUser;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black87,
          ),
          leadingWidth: 30,
          title: Text(
            "Search",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(defaultSpacing),
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: "Search for user",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ColoredBox(
                            color: Colors.red,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: IconButton(
                                onPressed: () => triggerSearch(),
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: _fetchUser,
                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.none) {
                          return Container();
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          List<User> users = snapshot.data;
                          if (users.length == 0) {
                            return Center(
                              child: Text("No Student found"),
                            );
                          }
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  child:
                                      Image.asset("assets/icons/student.png"),
                                ),
                                title: Text(users[index].name),
                              );
                            },
                            itemCount: users.length,
                          );
                        }
                      }))
            ],
          ),
        ));
  }

  Future<List<User>> _searchUser() async {
    Response response;
    try {
      response = await dioClient.get(
        "/students/search/${_searchController.text}",
      );

      List<User> users = [];

      response.data["data"].forEach((user) {
        users.add(User.fromServer(user));
      });

      return users;
    } catch (e) {
      print("error $e");
      return [];
    }
  }

  void triggerSearch() {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        _fetchUser = _searchUser();
      });
    }
  }
}
