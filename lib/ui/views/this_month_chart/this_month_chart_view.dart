import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/ui/universal_widgets/error_info.dart';
import 'package:Expenses_app/ui/universal_widgets/expenses_pie_chart.dart';
import 'package:Expenses_app/ui/universal_widgets/loading_spinner.dart';
import 'package:Expenses_app/ui/views/this_month_chart/new_category_button.dart';
import 'package:Expenses_app/ui/views/this_month_chart/new_expenditure_button.dart';
import 'package:Expenses_app/ui/views/this_month_chart/this_month_chart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ThisMonthChartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThisMonthChartViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      onViewModelReady: (model) => model.fetchData(),
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? LoadingSpinner()
            : !model.hasError
                ? ListView(
                    children: [
                      _ThisMonthExpensesChart(),
                      _ThisMonthTotalExpensesInfo(),
                      NewExpenditureButton(),
                      NewCategoryButton(),
                    ],
                  )
                : ListView(children: [
                    ErrorInfo(model.modelError.toString()),
                    NewExpenditureButton(),
                    NewCategoryButton(),
                  ]),
      ),
      viewModelBuilder: () => locator<ThisMonthChartViewModel>(),
    );
  }
}

class _ThisMonthExpensesChart extends ViewModelWidget<ThisMonthChartViewModel> {
  const _ThisMonthExpensesChart();

  @override
  Widget build(BuildContext context, ThisMonthChartViewModel model) {
    return model.data.isNotEmpty
        ? Container(
            padding: const EdgeInsets.only(top: 20),
            child: ExpensesPieChart.buildFromData(initialData: model.data),
          )
        : Container(
            padding: const EdgeInsets.all(30),
            height: 300,
            child: Image.asset(
              'assets/images/no_expenses.png',
              color: Colors.green,
            ),
          );
  }
}

class _ThisMonthTotalExpensesInfo
    extends ViewModelWidget<ThisMonthChartViewModel> {
  const _ThisMonthTotalExpensesInfo();

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
            'Wydatki w tym miesiącu',
            style: TextStyle(fontSize: 24, color: Colors.grey[300]),
          ),
        ],
      ),
    );
  }
}
