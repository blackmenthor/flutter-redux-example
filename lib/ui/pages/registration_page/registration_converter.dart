import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:flutter_redux_complete/core/redux/states/registration_state/registration_step.dart';
import 'package:flutter_redux_complete/ui/base/converter.dart';
import 'package:flutter_redux_complete/ui/pages/registration_page/registration_ui_state.dart';
import 'package:flutter_redux_complete/ui/pages/registration_page/registration_view_model.dart';
import 'package:redux/redux.dart';

class RegistrationConverter extends Converter<Store<AppState>, RegistrationViewModel> {

  @override
  RegistrationViewModel convert(Store<AppState> input) {
    String stepText;
    RegistrationUiState uiState;

    switch (input.state.registrationState.step) {
      case RegistrationStep.FIRST:
        stepText = "1/2";
        uiState = RegistrationUiState.FIRST_PAGE;
        break;
      case RegistrationStep.LAST:
        stepText = "2/2";
        uiState = RegistrationUiState.LAST_PAGE;
        break;
    }

    return RegistrationViewModel(
        stepText: stepText,
        uiState: uiState
    );
  }

}