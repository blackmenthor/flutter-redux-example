import 'package:flutter/material.dart';
import 'package:flutter_redux_complete/ui/base/view_model.dart';
import 'package:flutter_redux_complete/ui/pages/registration_page/registration_ui_state.dart';

class RegistrationViewModel extends ViewModel {

  final String stepText;
  final RegistrationUiState uiState;

  RegistrationViewModel({
     @required
     this.stepText,
     @required
     this.uiState
  });

}