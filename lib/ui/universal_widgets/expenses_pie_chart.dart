import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ExpensesPieChart extends StatelessWidget {
  final bool animate;
  final List<charts.Series> seriesList;

  const ExpensesPieChart({Key key, this.animate, this.seriesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        // TODO - create colorGenerator
        height: 350.0 + seriesList[0].data.length * 20.0,
        padding: const EdgeInsets.all(20),
        child: charts.PieChart(
          seriesList,
          animate: animate,
          behaviors: [
            charts.DatumLegend(
              position: charts.BehaviorPosition.bottom,
              horizontalFirst: false,
              cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
              showMeasures: true,
              legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
              measureFormatter: (num value) =>
                  value == null ? '-' : '-   $value',
            ),
          ],
          defaultInteractions: true,
        ),
      );

  factory ExpensesPieChart.buildFromData(
      {List<TotalCategoryExpenses> initialData, bool animate = true}) {
    return ExpensesPieChart(
      seriesList: _tranformDataToSeriesList(initialData),
      animate: animate,
    );
  }

  static List<charts.Series<TotalExpenses, String>> _tranformDataToSeriesList(
      List<TotalExpenses> initialData) {
    return [
      charts.Series(
        id: 'Expenses',
        data: initialData,
        domainFn: (TotalExpenses expenses, _) => expenses.name,
        measureFn: (TotalExpenses expenses, _) => expenses.totalMoneyAmount,
      ),
    ];
  }
}
