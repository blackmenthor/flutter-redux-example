import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_complete/core/redux/actions/registration/registration_actions.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:flutter_redux_complete/ui/components/default_button.dart';
import 'package:flutter_redux_complete/ui/components/default_text_field.dart';

class LastRegistrationPage extends StatelessWidget {

  final TextEditingController usernameController = TextEditingController();

  Widget usernameField() {
    return DefaultTextField(
      hintText: "Username",
      labelText: "Username",
    );
  }

  Widget button(BuildContext context) {
    return DefaultButton(
      text: "Register",
      onPressed: () {
        String username = usernameController.text;
        StoreProvider.of<AppState>(context).dispatch(SubmitAction(username: username));
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
          usernameField(),
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
