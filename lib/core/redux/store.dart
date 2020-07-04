import 'package:flutter/cupertino.dart';
import 'package:flutter_redux_complete/core/redux/middlewares/common_middleware.dart';
import 'package:flutter_redux_complete/core/redux/middlewares/navigation_middleware.dart';
import 'package:flutter_redux_complete/core/redux/middlewares/registration_middleware.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:flutter_redux_complete/core/redux/reducers/reducers.dart' as Reducer;
import 'package:redux/redux.dart';

class AppStore {

  static Store<AppState> createStore(
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    return Store<AppState>(
      Reducer.reduce,
      initialState: AppState(),
      middleware: [
        CommonMiddleware(),
        NavigationMiddleware(navigatorKey: navigatorKey),
        RegistrationMiddleware()
      ],
    );
  }

}