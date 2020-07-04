import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_complete/core/redux/actions/registration/registration_actions.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:flutter_redux_complete/ui/components/default_button.dart';
import 'package:flutter_redux_complete/ui/components/default_text_field.dart';

class FirstRegistrationPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();

  Widget emailField() {
    return DefaultTextField(
      hintText: "Email",
      labelText: "Email",
      controller: emailController,
    );
  }

  Widget button(BuildContext context) {
    return DefaultButton(
      text: "Submit Email",
      onPressed: () {
        String email = emailController.text;
        StoreProvider.of<AppState>(context).dispatch(GoToLastPageAction(email: email));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          emailField(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: button(context),
            ),
          )
        ],
      ),
    );
  }

}
