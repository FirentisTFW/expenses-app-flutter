import 'package:Expenses_app/ui/views/trends_view/selection_fields.dart';
import 'package:Expenses_app/ui/views/trends_view/trends_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TrendsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TrendsViewModel>.reactive(
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(title: const Text('Trends')),
        body: Container(
          height: 200,
          child: SelectionFields(),
        ),
      ),
      viewModelBuilder: () => TrendsViewModel(),
    );
  }
}
