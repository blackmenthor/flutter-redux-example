import 'package:flutter_redux_complete/core/controller/api_controller.dart';
import 'package:flutter_redux_complete/core/navigation/navigation_destinations.dart';
import 'package:flutter_redux_complete/core/redux/actions/navigation/navigation_actions.dart';
import 'package:flutter_redux_complete/core/redux/actions/registration/registration_actions.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:redux/redux.dart';

/// This middleware will intercept every action related to the Navigation actions.
class RegistrationMiddleware implements MiddlewareClass<AppState> {

  ApiController apiController;

  @override
  call(Store<AppState> store, action, next) {
    if (action is SubmitAction) {
      _handleSubmitAction(store, action);
    }

    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }

  Future<void> _handleSubmitAction(
      Store<AppState> store, SubmitAction action) async {

    store.dispatch(
      ShowDialogAction(
        destination: LoadingDialogDestination(
          title: "Verifying your Data..."
        )
      )
    );

    apiController.callApi(
      onSuccess: () {
        store.dispatch(NavigateBackAction());
        store.dispatch(
            ShowDialogAction(
                destination: SuccessDialogDestination(
                    title: "Success!",
                    msg: "Register Success",
                    onButtonClick: () {
                      store.dispatch(
                          NavigateToNextAndReplaceAction(destination: CompletedPageDestination())
                      );
                    }
                )
            )
        );
      }
    );
  }

}
