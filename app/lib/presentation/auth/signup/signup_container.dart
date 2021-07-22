import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_event.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/department/futo_departments.dart';
import 'package:app/domain/department/imsu_departments.dart';
import 'package:app/domain/department/palm_departments.dart';
import 'package:app/domain/user/user.dart';
import '../../widgets/form_bottom_sheet.dart';
import 'package:app/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Author: Ibekason Alexander
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _selectedUniversity = "Select university";
  var _selectedLevel = "Select your level";
  var _selectedDepartment = "Select your department";

  TextEditingController _nameController;
  var _departmentController = "";
  TextEditingController _emailController;
  TextEditingController _passwordController;
  var _levelController = "";
  var _universityController = "";
  FocusNode _passwordFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _nameFocusNode;

  @override
  void initState() {
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
      form: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          TextInputField(
            focusNode: _nameFocusNode,
            textEditingController: _nameController,
            title: "Name",
            placeholder: "What would you like to be called?",
          ),
          TextInputField(
            focusNode: _emailFocusNode,
            textEditingController: _emailController,
            title: "Email",
            placeholder: "Your email",
          ),
          TextInputField(
            textEditingController: _passwordController,
            focusNode: _passwordFocusNode,
            title: "Password",
            isPassword: true,
            placeholder: "Your password",
          ),
          Container(
            padding: EdgeInsets.all(5),
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

                  _selectedUniversity = userSchools["$s"];
                });
              },
              items: userSchools.keys
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(userSchools["$e"]),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(5),
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
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(5),
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
                  _departmentController = s.toString();
                  _selectedDepartment = s.toString();
                });

              },
              items: _getDepartmentList()
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
            ),
          ),
          kVerticalSpaceMedium,
          Text(
            "By continuing, you indicate that you agree to MySchool's Terms of Services and Privacy Policy?",
            style: TextStyle(color: Colors.grey),
          ),
        ],
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
    setState(() {
      _selectedDepartment = "Select your department";
    });
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
    print("unfocus");
    _passwordFocusNode.unfocus();
    _emailFocusNode.unfocus();
    _nameFocusNode.unfocus();
  }

  void _signUp() {
    var signUpRequest = SignUpRequest(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      department: _departmentController.trim(),
      university: _universityController,
      name: _nameController.text.trim(),
      level: _levelController,
    );
    var authenticationBloc = context.read<AuthenticationBloc>();
    authenticationBloc.add(SignUpEvent(signUpRequest));
  }
}
