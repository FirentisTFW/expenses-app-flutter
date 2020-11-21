import 'package:Expenses_app/ui/views/last_expenditures/last_months_bar_chart.dart';
import 'package:Expenses_app/ui/views/last_expenditures/smart_widgets/last_months_expenses_chart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LastMonthsExpensesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LastMonthsExpensesChartViewModel>.reactive(
      builder: (context, model, child) => model.isBusy
          ? loadingSpinner
          : !model.hasError
              ? LastMonthsBarChart.buildFromData(initialData: model.data)
              : Container(
                  child: Text('err'),
                  // TODO: show error dialog
                ),
      viewModelBuilder: () => LastMonthsExpensesChartViewModel(),
    );
  }

  final loadingSpinner = Padding(
    padding: const EdgeInsets.symmetric(vertical: 50),
    child: Center(child: CircularProgressIndicator()),
  );
}
