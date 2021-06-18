import 'package:app/presentation/auth/form_bottom_sheet.dart';
import 'package:app/presentation/auth/login/login_container.dart';
import 'package:app/presentation/auth/signup/signup_container.dart';
import 'package:app/presentation/widgets/local_auth_container.dart';
import 'package:app/presentation/widgets/social_media_login_container.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = "/auth";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var containerKey;

  @override
  void initState() {
    containerKey = ValueKey("mainContainer");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilt authscreen");
    return Scaffold(
      body: Container(
        key: containerKey,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/myschool_landing.jpg",
                )),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.8],
              colors: [Colors.grey, Colors.grey.shade500],
            )
//          color: Colors.grey
            ),
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "MySchool",
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        "A place to share knowledge and connect with fellow students",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SocialMediaLoginContainer(
                  "assets/icons/google.png", "Continue with Google"),
              SocialMediaLoginContainer(
                  "assets/icons/facebook.png", "Continue with Facebook"),
              SizedBox(
                height: 15,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: LocalAuthContainer(
                      onTap: _onLogin,
                      title: "Login",
                    )),
                    Expanded(
                      child: LocalAuthContainer(
                          onTap: _onSignUp, title: "Sign up with email"),
                    ),
                  ]),
              Divider(
                color: Colors.white,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "By continuing you indicate that you agree to MySchools's Terms of Service and Privacy Policy",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Container(
                child: FittedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Languages",
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Learn More",
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "MySchool, Inc. 2021",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() {

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context)  {
      return LoginScreen();
    });
  }

  void _onSignUp() {
    showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        builder: (context)  {
          return SignUpScreen();
        });
  }
}
