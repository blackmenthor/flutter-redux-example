import 'package:flutter_redux_complete/core/redux/reducers/registration_reducer.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';

final Map<Type, Function> _reducers = Map()
  ..addAll(registrationReducers);

AppState reduce(AppState state, dynamic action) {
  for (var actionType in _reducers.keys) {
    if (action.runtimeType == actionType) {
      return _reducers[actionType](action, state);
    }
  }

  // If we get here, it means the action dispatched has no reducer,
  // so we just return the unchanged state:
  return state;
}
