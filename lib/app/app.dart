import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_complete/core/redux/actions/common/common_actions.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:flutter_redux_complete/core/redux/store.dart';
import 'package:flutter_redux_complete/ui/pages/registration_page/registration_page.dart';
import 'package:flutter_redux_complete/ui/utils/constants.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {

  Store<AppState> store;
  GlobalKey<NavigatorState> navigatorKey;

  App() {
    this.navigatorKey = GlobalKey<NavigatorState>();
    this.store = AppStore.createStore(navigatorKey);

    // DO YOUR THING ON APP KICKOFF EVENT
    store.dispatch(KickOffAppAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: Constants.APP_NAME,
        home: RegistrationPage(),
      ),
    );
  }
}
