import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GeneralLoadingDialog extends StatelessWidget {

  final String msg;

  GeneralLoadingDialog({
     @required
     this.msg
  });

  Widget _buildDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CircularProgressIndicator(),
            ),
            Text(
              msg,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700
              ),
            )
          ],
        ),
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
