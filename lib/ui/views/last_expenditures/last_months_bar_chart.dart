import 'package:Expenses_app/datamodels/monthly_expenses.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LastMonthsBarChart extends StatelessWidget {
  final bool animate;
  final List<charts.Series> seriesList;

  LastMonthsBarChart({this.animate = true, @required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title,
        buildBarChart(),
      ],
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

  buildBarChart() => Container(
        height: 300,
        padding: const EdgeInsets.all(20),
        child: charts.BarChart(
          seriesList,
          animate: animate,
          barRendererDecorator: charts.BarLabelDecorator<String>(),
          domainAxis: domainAxisSpec,
          primaryMeasureAxis: primaryMeasureAxisSpec,
        ),
      );

  factory LastMonthsBarChart.buildFromData(
      List<MonthlyExpenses> initialData, bool animate) {
    return LastMonthsBarChart(
      seriesList: _tranformDataToSeriesList(initialData),
      animate: animate,
    );
  }

  factory LastMonthsBarChart.buildSampleData() {
    final sampleData = [
      MonthlyExpenses(monthNumber: '8', totalMoneyAmount: 2154),
      MonthlyExpenses(monthNumber: '9', totalMoneyAmount: 543),
      MonthlyExpenses(monthNumber: '10', totalMoneyAmount: 2497),
      MonthlyExpenses(monthNumber: '11', totalMoneyAmount: 1023),
    ];

    return LastMonthsBarChart(
      seriesList: _tranformDataToSeriesList(sampleData),
      animate: true,
    );
  }

  static List<charts.Series<MonthlyExpenses, String>> _tranformDataToSeriesList(
      List<MonthlyExpenses> initialData) {
    return [
      charts.Series(
        id: 'Expenses',
        data: initialData,
        domainFn: (MonthlyExpenses expenses, _) => expenses.monthNumber,
        measureFn: (MonthlyExpenses expenses, _) => expenses.totalMoneyAmount,
        // styling
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        labelAccessorFn: (MonthlyExpenses expenses, _) =>
            expenses.totalMoneyAmount.toString(),
        insideLabelStyleAccessorFn: (_, __) => charts.TextStyleSpec(
          fontSize: 14,
          color: charts.MaterialPalette.white,
          lineHeight: 4.0,
        ),
        outsideLabelStyleAccessorFn: (_, __) => charts.TextStyleSpec(
          fontSize: 14,
          color: charts.MaterialPalette.gray.shade100,
        ),
      ),
    ];
  }

  // STYLING

  final domainAxisSpec = charts.OrdinalAxisSpec(
    renderSpec: charts.SmallTickRendererSpec(
      labelStyle: charts.TextStyleSpec(
        fontSize: 16,
        color: charts.MaterialPalette.gray.shade400,
      ),
      lineStyle:
          charts.LineStyleSpec(color: charts.MaterialPalette.gray.shade400),
    ),
  );

  final primaryMeasureAxisSpec = charts.NumericAxisSpec(
    renderSpec: charts.GridlineRendererSpec(
      labelStyle: charts.TextStyleSpec(
        fontSize: 14,
        color: charts.MaterialPalette.gray.shade400,
      ),
      lineStyle:
          charts.LineStyleSpec(color: charts.MaterialPalette.gray.shade400),
    ),
    tickProviderSpec: charts.BasicNumericTickProviderSpec(
        desiredTickCount: 4, zeroBound: true),
  );

  // END - STYLING
}
