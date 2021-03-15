import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  final EdgeInsets padding;

  const LoadingSpinner({this.padding});

  @override
  Widget build(BuildContext context) {
    if (padding != null) {
      return Padding(
        padding: padding,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return Center(child: CircularProgressIndicator());
  }
}
