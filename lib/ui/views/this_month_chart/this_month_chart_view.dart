import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/ui/universal_widgets/expenses_pie_chart.dart';
import 'package:Expenses_app/ui/universal_widgets/last_months_bar_chart.dart';
import 'package:Expenses_app/ui/views/this_month_chart/this_month_chart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ThisMonthChartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThisMonthChartViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? loadingSpinner
            : !model.hasError
                ? ListView(
                    children: [
                      ThisMonthExpensesChart(),
                      _ThisMonthTotalExpensesInfo()
                    ],
                  )
                : Container(
                    child: Text('err'),
                    // TODO: show error dialog
                  ),
      ),
      viewModelBuilder: () => locator<ThisMonthChartViewModel>(),
    );
  }

  final loadingSpinner = Center(child: CircularProgressIndicator());
}

class ThisMonthExpensesChart extends ViewModelWidget<ThisMonthChartViewModel> {
  ThisMonthExpensesChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ThisMonthChartViewModel model) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: ExpensesPieChart.buildFromData(initialData: model.data),
    );
  }
}

class _ThisMonthTotalExpensesInfo
    extends ViewModelWidget<ThisMonthChartViewModel> {
  _ThisMonthTotalExpensesInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ThisMonthChartViewModel model) {
    return Container(
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.getThisMonthTotalSpending(),
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'This month\'s expenses',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
