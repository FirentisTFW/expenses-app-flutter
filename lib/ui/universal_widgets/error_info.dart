import 'package:flutter/material.dart';

class ErrorInfo extends StatelessWidget {
  final String errorText;

  const ErrorInfo(
    this.errorText, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Center(child: Text(errorText)),
    );
  }
}
