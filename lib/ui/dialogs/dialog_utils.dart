import 'package:flutter/cupertino.dart';

abstract final class DialogUtils {
  const DialogUtils._();

  static void showModalPopup(BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
        height: 300,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
