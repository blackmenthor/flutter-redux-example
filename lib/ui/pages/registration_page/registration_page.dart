import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_complete/core/redux/actions/registration/registration_actions.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:flutter_redux_complete/ui/components/default_app_bar.dart';
import 'package:flutter_redux_complete/ui/pages/registration_page/first_step/first_registration_page.dart';
import 'package:flutter_redux_complete/ui/pages/registration_page/last_step/last_registration_page.dart';
import 'package:flutter_redux_complete/ui/pages/registration_page/registration_converter.dart';
import 'package:flutter_redux_complete/ui/pages/registration_page/registration_ui_state.dart';
import 'package:flutter_redux_complete/ui/pages/registration_page/registration_view_model.dart';

class RegistrationPage extends StatelessWidget {

  final converter = RegistrationConverter();

  Widget appBar(BuildContext context, RegistrationViewModel viewModel) {
    return DefaultAppBar(
      withBackBtn: viewModel.uiState == RegistrationUiState.LAST_PAGE,
      onBackPressed: () => StoreProvider.of<AppState>(context).dispatch(GoToFirstPageAction()),
    );
  }

  Widget stepTitle(RegistrationViewModel viewModel) {
    TextStyle style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Registration Progress: ",
            style: style,
          ),
          Text(
              viewModel.stepText,
            style: style,
          )
        ],
      ),
    );
  }

  Widget pageWidget(RegistrationViewModel viewModel) {
    Widget page;
    switch (viewModel.uiState) {
      case RegistrationUiState.FIRST_PAGE:
        page = FirstRegistrationPage();
        break;
      case RegistrationUiState.LAST_PAGE:
        page = LastRegistrationPage();
        break;
    }

    return Expanded(
      child: page,
    );
  }

  Widget mainWidget(BuildContext context) {
    return StoreConnector(
      converter: converter.convert,
      builder: (context, viewModel) {
        return Scaffold(
          appBar: appBar(context, viewModel),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                stepTitle(viewModel),
                pageWidget(viewModel)
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return mainWidget(context);
  }
}
