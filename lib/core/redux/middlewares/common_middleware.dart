import 'package:flutter_redux_complete/core/redux/actions/common/common_actions.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:redux/redux.dart';

/// This middleware will intercept every action related to the Navigation actions.
class CommonMiddleware implements MiddlewareClass<AppState> {

  @override
  call(Store<AppState> store, action, next) {
    if (action is KickOffAppAction) {
      _handleKickOffAppAction(store, action);
    }

    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }

  Future<void> _handleKickOffAppAction(
      Store<AppState> store, KickOffAppAction action) async {
    // TODO: DO SOMETHING ON APP KICKOFF HERE
  }

}
