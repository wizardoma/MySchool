import 'package:app/presentation/auth/form_bottom_sheet.dart';
import 'package:app/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBottomSheet(
      title: "Login",
      onButtonPressed: () => print("pressed login"),
      form: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextInputField(
              textEditingController: _emailController,
              title: "Email",
              placeholder: "Your email",
            ),
            SizedBox(
              height: 10,
            ),
            TextInputField(
              textEditingController: _passwordController,
              title: "Password",
              placeholder: "Your password",
              isPassword: true,
            ),
            Text(
              "Forgot password?",
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
    super.dispose();
  }
}
