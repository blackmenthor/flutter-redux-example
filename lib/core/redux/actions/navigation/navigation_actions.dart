import 'package:flutter/material.dart';
import 'package:flutter_redux_complete/core/navigation/navigation_destinations.dart';

class NavigateToNextAction {

  NavigateToNextAction({@required this.destination});

  final NavigationDestination destination;

}

class NavigateToNextAndReplaceAction {

  NavigateToNextAndReplaceAction({@required this.destination});

  final NavigationDestination destination;

}

class ShowDialogAction {

  ShowDialogAction({
    @required
    this.destination,
    this.barrierDismissible = true
  });

  final NavigationDestination destination;
  final bool barrierDismissible;

}

class ShowBottomSheetAction {

  ShowBottomSheetAction({
    @required
    this.destination,
    this.shape
  });

  final NavigationDestination destination;
  final ShapeBorder shape;

}

class NavigateBackAction {}
