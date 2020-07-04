import 'package:flutter/material.dart';
import 'package:flutter_redux_complete/ui/dialogs/general_failed_dialog.dart';
import 'package:flutter_redux_complete/ui/dialogs/general_loading_dialog.dart';
import 'package:flutter_redux_complete/ui/dialogs/general_success_dialog.dart';
import 'package:flutter_redux_complete/ui/pages/completed_page/completed_page.dart';

abstract class NavigationDestination {
  Widget buildWidget(BuildContext context);
}

class CompletedPageDestination extends NavigationDestination{
  @override
  Widget buildWidget(BuildContext context) {
    return CompletedPage();
  }
}

class LoadingDialogDestination extends NavigationDestination {
  final String title;

  LoadingDialogDestination({
    this.title,
  });

  @override
  Widget buildWidget(BuildContext context) {
    return GeneralLoadingDialog(
      msg: title,
    );
  }
}

class FailedDialogDestination extends NavigationDestination {
  final String title;
  final String errorMsg;

  FailedDialogDestination({
      this.title,
      this.errorMsg
  });

  @override
  Widget buildWidget(BuildContext context) {
    return GeneralFailedDialog(
       title: title,
       errorMessage: errorMsg,
    );
  }
}

class SuccessDialogDestination extends NavigationDestination {
  final String title;
  final String msg;
  final VoidCallback onButtonClick;

  SuccessDialogDestination({
    this.title,
    this.msg,
    this.onButtonClick
  });

  @override
  Widget buildWidget(BuildContext context) {
    return GeneralSuccessDialog(
      title: title,
      message: msg,
      onButtonClick: onButtonClick,
    );
  }
}