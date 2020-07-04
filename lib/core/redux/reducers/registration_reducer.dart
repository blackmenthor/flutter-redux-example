import 'package:flutter_redux_complete/core/redux/actions/registration/registration_actions.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:flutter_redux_complete/core/redux/states/registration_state/registration_state.dart';
import 'package:flutter_redux_complete/core/redux/states/registration_state/registration_step.dart';

const Map<Type, Function> registrationReducers = {
  //GoToFirstPageAction
  GoToFirstPageAction: _goToFirstReducer,
  //GoToLastPageAction
  GoToLastPageAction: _goToLastReducer,
  //SubmitAction
  SubmitAction: _submitReducer,
};

AppState _goToFirstReducer(
    GoToFirstPageAction action,
    AppState state,
    ) {
  RegistrationState registrationState = state.registrationState.copyWith(
    step: RegistrationStep.FIRST
  );
  return state.copyWith(
    registrationState: registrationState
  );
}

AppState _goToLastReducer(
    GoToLastPageAction action,
    AppState state,
    ) {
  RegistrationState registrationState = state.registrationState.copyWith(
      step: RegistrationStep.LAST,
      email: action.email
  );
  return state.copyWith(
      registrationState: registrationState
  );
}

AppState _submitReducer(
    SubmitAction action,
    AppState state,
    ) {
  RegistrationState registrationState = state.registrationState.copyWith(
      username: action.username
  );
  return state.copyWith(
      registrationState: registrationState
  );
}
