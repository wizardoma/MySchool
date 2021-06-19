import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_event.dart';
import 'package:app/application/auth/auth_state.dart';
import 'package:app/application/auth/login_request.dart';
import 'package:app/presentation/auth/form_bottom_sheet.dart';
import 'package:app/presentation/home/home_screen.dart';
import 'package:app/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  void _login() {
    print("login pressed");
    var loginRequest =
        LoginRequest(_emailController.text, _passwordController.text);
    var authenticationBloc = context.read<AuthenticationBloc>();
    authenticationBloc.add(LoginEvent(loginRequest));
  }

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
      onButtonPressed: _login,
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
