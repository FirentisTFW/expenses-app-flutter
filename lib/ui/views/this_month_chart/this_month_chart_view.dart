import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/ui/universal_widgets/expenses_pie_chart.dart';
import 'package:Expenses_app/ui/views/this_month_chart/smart_widgets/new_category_button.dart';
import 'package:Expenses_app/ui/views/this_month_chart/smart_widgets/new_expenditure_button.dart';
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
                      _ThisMonthExpensesChart(),
                      _ThisMonthTotalExpensesInfo(),
                      NewExpenditureButton(),
                      NewCategoryButton(),
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

class _ThisMonthExpensesChart extends ViewModelWidget<ThisMonthChartViewModel> {
  _ThisMonthExpensesChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ThisMonthChartViewModel model) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
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
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.getThisMonthTotalSpending(),
            style: TextStyle(fontSize: 36),
          ),
          Text(
            'This month\'s expenses',
            style: TextStyle(fontSize: 24, color: Colors.grey[300]),
          ),
        ],
      ),
    );
  }
}
