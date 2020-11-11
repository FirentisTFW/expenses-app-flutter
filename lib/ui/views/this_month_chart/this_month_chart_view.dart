import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/ui/views/this_month_chart/this_month_chart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ThisMonthChartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThisMonthChartViewModel>.nonReactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Container(
            child: Text('This month chart'),
          ),
        ),
      ),
      viewModelBuilder: () => locator<ThisMonthChartViewModel>(),
    );
  }
}
