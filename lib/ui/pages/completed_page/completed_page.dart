import 'package:flutter/material.dart';
import 'package:flutter_redux_complete/ui/components/default_app_bar.dart';

class CompletedPage extends StatelessWidget {

  Widget mainWidget(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                size: 56,
              ),
              Text(
                  "Registration Completed",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return mainWidget(context);
  }

}
