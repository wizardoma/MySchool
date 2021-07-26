import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_state.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormBottomSheet extends StatelessWidget {
  final String title;
  final Function onButtonPressed;
  final Widget form;

  const FormBottomSheet({Key key, this.title, this.onButtonPressed, this.form})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (c, ctn) => Column(

          children: [
            kVerticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CloseButton(
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Spacer(),
            ],),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 6),
                  child: ListView(
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        shrinkWrap: true,
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
                                InkWell(
                                  onTap: onButtonPressed,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: defaultSpacing * 0.5, horizontal: defaultSpacing),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: BlocBuilder<AuthenticationBloc,
                                        AuthenticationState>(
                                      builder: (context, state) {
                                        if (state is AuthenticatingState) {
                                          return SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            ),
                                          );
                                        }
                                        return Text(
                                          title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        );
                                      },
                                    ),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            child: form,
                          ),
                        ],
                      ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
