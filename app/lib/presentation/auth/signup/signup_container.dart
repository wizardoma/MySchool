import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_event.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:app/application/university/department.dart';
import 'package:app/application/university/university.dart';
import 'package:app/commons/api.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/commons/utils/input_validator.dart';
import 'package:app/domain/department/futo_departments.dart';
import 'package:app/domain/department/imsu_departments.dart';
import 'package:app/domain/department/palm_departments.dart';
import 'package:app/domain/user/user.dart';
import 'package:app/presentation/widgets/text_input_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/form_bottom_sheet.dart';

/// Author: Ibekason Alexander
class SignUpScreen extends StatefulWidget{
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with InputValidator{
  var _selectedUniversity = "Select university";
  var _selectedLevel = "Select your level";
  var _selectedDepartment = "Select your department";

  List<University> universities;

  TextEditingController _nameController;
  var _departmentController = "";
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _matricNoController;
  var _levelController = "";
  var _universityController = "";
  FocusNode _passwordFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _nameFocusNode;
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    dioClient.get("/universities").then((response) {
      List<University> unis = [];
      response.data["data"].forEach(
        (uni) {
          unis.add(
            University.fromServer(uni),
          );
        },
      );
      setState(() {
        universities = unis;
      });
      return universities;
    }).catchError((response) {
      print(
        "error fetching universities",
      );
    }).then((unis) async {
      List<University> universitiesWithDepartment = [];
      unis.forEach((element) async {
        List<Department> departments = [];
        var response = await dioClient
            .get("/universities/departments/${element.shortName}");
        response.data["data"].forEach(
          (dep) {
            departments.add(
              Department.fromServer(dep),
            );
          },
        );
        universitiesWithDepartment.add(University(
          id: element.id,
          fullName: element.fullName,
          shortName: element.shortName,
          department: departments,
        ));
      });

      while (universitiesWithDepartment.length < unis.length) {
        await Future.delayed(Duration(milliseconds: 100));
      }
      setState(() {
        universities = universitiesWithDepartment;
      });
    });

    _matricNoController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordFocusNode = FocusNode();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBottomSheet(
      title: "Sign up",
      onButtonPressed: _signUp,
      form: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            TextInputField(
              inputValidator: validateName,
              focusNode: _nameFocusNode,
              textEditingController: _nameController,
              title: "Name",
              placeholder: "What would you like to be called?",
            ),
            kVerticalSpaceRegular,
            TextInputField(
              inputValidator: validateEmail,
              focusNode: _emailFocusNode,
              textEditingController: _emailController,
              title: "Email",
              placeholder: "Your email",
            ),
            kVerticalSpaceRegular,
            TextInputField(
              inputValidator: validatePassword,
              textEditingController: _passwordController,
              focusNode: _passwordFocusNode,
              title: "Password",
              isPassword: true,
              placeholder: "Your password",
            ),
            kVerticalSpaceRegular,
            TextInputField(
              inputValidator: emptyFieldValidator,
              textEditingController: _matricNoController,
              title: "Matriculation Number",
              isPassword: false,
              placeholder: "Your Matric Number",
            ),
            kVerticalSpaceRegular,
            Container(
              padding: EdgeInsets.all(defaultSpacing * 0.5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 0.5)),
              child: DropdownButton(
                isExpanded: true,
                iconSize: 30,
                underline: SizedBox(),
                iconEnabledColor: Theme.of(context).primaryColor,
                hint: Text(_selectedUniversity),
                onChanged: (s) {
                  unfocusNodes();
                  setState(() {
                    _universityController = s.toString();

                    _selectedUniversity = universities
                        .firstWhere((element) => element.id == s)
                        .fullName;

                    _selectedDepartment = "Select your department";
                  });
                },
                items: universities == null
                    ? [
                        DropdownMenuItem(
                          child: Text(
                            "Loading Universities",
                          ),
                        )
                      ]
                    : universities
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.fullName),
                          ),
                        )
                        .toList(),
              ),
            ),
            kVerticalSpaceRegular,
            Container(
              padding: EdgeInsets.all(defaultSpacing * 0.5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 0.5)),
              child: DropdownButton(
                isExpanded: true,
                iconSize: 30,
                underline: SizedBox(),
                iconEnabledColor: Theme.of(context).primaryColor,
                hint: Text(_selectedLevel),
                onChanged: (s) {
                  unfocusNodes();

                  setState(() {
                    _levelController = s.toString();
                    _selectedLevel = s.toString();
                  });
                },
                items: userLevels
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
            ),
            kVerticalSpaceRegular,
            Container(
              padding: EdgeInsets.all(defaultSpacing * 0.5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 0.5)),
              child: DropdownButton(
                isExpanded: true,
                iconSize: 30,
                underline: SizedBox(),
                iconEnabledColor: Theme.of(context).primaryColor,
                hint: Text(_selectedDepartment),
                onChanged: (s) {
                  unfocusNodes();
                  setState(() {
                    _departmentController = s["id"].toString();
                    _selectedDepartment = s["name"];
                  });
                },
                items: universities == null
                    ? [
                        DropdownMenuItem(
                          child: Text(
                            "Loading Departments",
                          ),
                        ),
                      ]
                    : _universityController.isEmpty
                        ? [
                            DropdownMenuItem(
                              child: Text(
                                "Select a University",
                              ),
                            )
                          ]
                        : universities
                            .firstWhere(
                              (element) =>
                                  element.id ==
                                  int.parse(
                                    _universityController,
                                  ),
                            )
                            .department
                            .map(
                              (e) => DropdownMenuItem(
                                value: {"id" : e.id, "name": e.name},
                                child: Text(e.name),
                              ),
                            )
                            .toList(),
              ),
            ),
            kVerticalSpaceRegular,
            Text(
              "By continuing, you indicate that you agree to MySchool's Terms of Services and Privacy Policy?",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }

  List<String> _getDepartmentList() {
    if (_universityController == "futo") {
      return futoDepartments;
    } else if (_universityController == "palm") {
      return palmDepartments;
    } else if (_universityController == "imsu") {
      return imsuDepartments;
    } else {
      return [_selectedDepartment];
    }
  }

  void unfocusNodes() {
    _passwordFocusNode.unfocus();
    _emailFocusNode.unfocus();
    _nameFocusNode.unfocus();
  }


  void _signUp() {
    var signUpRequest = SignUpRequest(
      matricNo: _matricNoController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      departmentId: _departmentController.trim(),
      universityId: _universityController,
      name: _nameController.text.trim(),
      level: _levelController,
    );
//    print(signUpRequest);
    if (_formKey.currentState.validate()) {
    var authenticationBloc = context.read<AuthenticationBloc>();
    authenticationBloc.add(SignUpEvent(signUpRequest));
    }

  }
}
