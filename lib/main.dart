import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/ui/setup/custom_dialog_setup.dart';
import 'package:Expenses_app/ui/setup/themes_setup.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/router.gr.dart' as router;

void main() {
  setupLocator();
  setupDialogUI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      theme: CustomTheme.getTheme(),
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: router.Routes.homeView,
      onGenerateRoute: router.Router().onGenerateRoute,
    );
  }
}
