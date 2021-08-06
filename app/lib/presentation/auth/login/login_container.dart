import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_event.dart';
import 'package:app/application/auth/login_request.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/commons/utils/input_validator.dart';
import '../../widgets/form_bottom_sheet.dart';
import 'package:app/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with InputValidator {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  var _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState.validate()) {
      var loginRequest =
          LoginRequest(_emailController.text, _passwordController.text);
      var authenticationBloc = context.read<AuthenticationBloc>();
      authenticationBloc.add(LoginEvent(loginRequest));
    }
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
      form: Form(
        key: _formKey,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInputField(
                textEditingController: _emailController,
                title: "Email",
                placeholder: "Your email",
              ),
              kVerticalSpaceSmall,
              TextInputField(
                textEditingController: _passwordController,
                title: "Password",
                placeholder: "Your password",
                isPassword: true,
              ),
              kVerticalSpaceSmall,
              Text(
                "Forgot password?",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
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
