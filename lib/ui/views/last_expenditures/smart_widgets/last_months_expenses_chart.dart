import 'package:Expenses_app/ui/universal_widgets/error_info.dart';
import 'package:Expenses_app/ui/universal_widgets/last_months_bar_chart.dart';
import 'package:Expenses_app/ui/universal_widgets/loading_spinner.dart';
import 'package:Expenses_app/ui/views/last_expenditures/smart_widgets/last_months_expenses_chart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LastMonthsExpensesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LastMonthsExpensesChartViewModel>.reactive(
      builder: (context, model, child) => model.isBusy
          ? LoadingSpinner(padding: EdgeInsets.symmetric(vertical: 50))
          : !model.hasError
              ? Column(
                  children: [
                    title,
                    LastMonthsBarChart.buildFromData(initialData: model.data),
                  ],
                )
              : ErrorInfo(model.modelError.toString()),
      viewModelBuilder: () => LastMonthsExpensesChartViewModel(),
    );
  }

  final title = Container(
    padding: const EdgeInsets.only(top: 40, bottom: 10),
    width: double.infinity,
    child: const Text(
      'Last months\' total expenses',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 28),
    ),
  );
}
