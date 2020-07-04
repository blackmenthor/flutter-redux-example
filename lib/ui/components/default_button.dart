import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  DefaultButton({
     @required
     this.text,
     @required
     this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
        ),
        color: Colors.blueAccent,
        onPressed: () => onPressed(),
      ),
    );
  }

}
