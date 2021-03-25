import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const AddButton({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.red[400],
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            text,
            style: TextStyle(fontSize: 22),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
