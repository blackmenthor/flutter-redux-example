import 'package:flutter/material.dart';
import 'package:flutter_redux_complete/core/redux/actions/navigation/navigation_actions.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:redux/redux.dart';

/// This middleware will intercept every action related to the Navigation actions.
class NavigationMiddleware implements MiddlewareClass<AppState> {

  final GlobalKey<NavigatorState> navigatorKey;

  NavigationMiddleware({
    @required
    this.navigatorKey,
  });

  @override
  call(Store<AppState> store, action, next) {
    if (action is NavigateToNextAction) {
      _handleNavigateToNextAction(store, action);
    } else if (action is NavigateToNextAndReplaceAction) {
      _handleNavigateToNextAndReplaceAction(store, action);
    } else if (action is NavigateBackAction) {
      _handleNavigateBackAction(store, action);
    } else if (action is ShowDialogAction) {
      _handleShowDialogAction(store, action);
    } else if (action is ShowBottomSheetAction) {
      _handleShowBottomSheetAction(store, action);
    }

    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }

  Future<void> _handleNavigateToNextAction(
      Store<AppState> store, NavigateToNextAction action) async {
    navigatorKey.currentState.push(MaterialPageRoute(
        builder: action.destination.buildWidget
    ));
  }

  Future<void> _handleNavigateToNextAndReplaceAction(
      Store<AppState> store, NavigateToNextAndReplaceAction action) async {
    navigatorKey.currentState.pushReplacement(MaterialPageRoute(
        builder: action.destination.buildWidget
    ));
  }

  Future<void> _handleNavigateBackAction(
      Store<AppState> store, NavigateBackAction action) async {
    navigatorKey.currentState.pop();
  }

  Future<void> _handleShowDialogAction(
      Store<AppState> store, ShowDialogAction action) async {
    showDialog(
      context: navigatorKey.currentState.overlay.context,
      barrierDismissible: action.barrierDismissible,
      builder: action.destination.buildWidget,
    );
  }

  Future<void> _handleShowBottomSheetAction(
      Store<AppState> store, ShowBottomSheetAction action) async {
    showModalBottomSheet(
        context: navigatorKey.currentState.overlay.context,
        shape: action.shape,
        builder: action.destination.buildWidget
    );
  }

}
