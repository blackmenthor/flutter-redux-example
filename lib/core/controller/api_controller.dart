import 'package:flutter/material.dart';

class ApiController {

  void callApi({
    VoidCallback onSuccess
  }) {
    Future.delayed(
        Duration(seconds: 3),
        () {
          onSuccess();
        }
    );
  }

}