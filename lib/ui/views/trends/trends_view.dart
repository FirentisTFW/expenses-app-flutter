import 'package:Expenses_app/datamodels/enums/grouping_method.dart';
import 'package:Expenses_app/ui/universal_widgets/error_info.dart';
import 'package:Expenses_app/ui/universal_widgets/expenses_pie_chart.dart';
import 'package:Expenses_app/ui/universal_widgets/last_months_bar_chart.dart';
import 'package:Expenses_app/ui/universal_widgets/loading_spinner.dart';
import 'package:Expenses_app/ui/views/trends/selection_fields.dart';
import 'package:Expenses_app/ui/views/trends/trends_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TrendsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TrendsViewModel>.reactive(
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(title: const Text('Trends')),
        body: ListView(
          children: [
            SelectionFields(),
            TrendsChart(),
          ],
        ),
      ),
      viewModelBuilder: () => TrendsViewModel(),
    );
  }
}

class TrendsChart extends ViewModelWidget<TrendsViewModel> {
  @override
  Widget build(BuildContext context, TrendsViewModel model) {
    return model.isBusy
        ? LoadingSpinner(padding: EdgeInsets.symmetric(vertical: 50))
        : !model.hasError
            ? model.isDataFetched
                ? model.data.isNotEmpty
                    ? _buildChart(model)
                    : noDataInfo
                : Container()
            : Container(
                padding: const EdgeInsets.all(30),
                child: ErrorInfo(model.modelError.toString()));
  }

  Widget _buildChart(TrendsViewModel model) {
    switch (model.groupingMethod) {
      case GroupingMethod.ByMonths:
        return LastMonthsBarChart.buildFromData(initialData: model.data);
      case GroupingMethod.ByCategories:
        return ExpensesPieChart.buildFromData(
          initialData: model.dataSortedByAmout,
          legend: true,
        );
    }
    return Container();
  }

  final noDataInfo = Container(
    child: const Center(
        child: Padding(
      padding: EdgeInsets.only(top: 40),
      child: Text('No data for selected range'),
    )),
  );
}
