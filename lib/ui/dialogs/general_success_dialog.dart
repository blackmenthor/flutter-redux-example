import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_complete/core/redux/actions/navigation/navigation_actions.dart';
import 'package:flutter_redux_complete/core/redux/states/app_state/app_state.dart';
import 'package:redux/redux.dart';

// ignore: must_be_immutable
class GeneralSuccessDialog extends StatelessWidget {

  String title;
  String message;
  String buttonText;
  VoidCallback onButtonClick;

  GeneralSuccessDialog({
    @required
    this.title,
    @required
    this.message,
    this.buttonText,
    this.onButtonClick,
  });

  Widget _buildIcon(BuildContext context) {
    return Icon(
      Icons.check_circle,
      color: Colors.green,
      size: 48.0,
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 0.5,
            color: Colors.black,
          ),
          GestureDetector(
            onTap: () {
              StoreProvider.of<AppState>(context).dispatch(NavigateBackAction());
              if (onButtonClick != null) onButtonClick();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  )
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    buttonText ?? "OK",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 16.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _buildIcon(context),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _buildButton(context)
            ],
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // need to wait for redirect to other page
      child: _buildDialog(context),
    );
  }
}
