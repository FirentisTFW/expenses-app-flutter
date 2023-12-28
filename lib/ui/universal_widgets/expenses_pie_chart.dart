import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/services/functional_services/chart_color_generator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ExpensesPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final bool legend;

  ExpensesPieChart({
    super.key,
    required this.animate,
    required this.seriesList,
    required this.legend,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: _getHeight(),
        padding: const EdgeInsets.all(20),
        child: charts.PieChart(
          seriesList,
          animate: animate,
          defaultRenderer: legend ? null : _defaultRenderer,
          behaviors: legend ? _showLegend() : [],
        ),
      );

  factory ExpensesPieChart.buildFromData({
    required List<TotalCategoryExpenses> initialData,
    bool animate = true,
    legend = false,
  }) {
    return ExpensesPieChart(
      seriesList: _tranformDataToSeriesList(initialData),
      animate: animate,
      legend: legend,
    );
  }

  static List<charts.Series<TotalExpenses, String>> _tranformDataToSeriesList(
      List<TotalExpenses> initialData) {
    var colorGenerator = ChartColorGenerator.buildWithSampleColors();
    return [
      charts.Series(
        id: 'Expenses',
        data: initialData,
        domainFn: (TotalExpenses expenses, _) => expenses.name,
        measureFn: (TotalExpenses expenses, _) => expenses.totalMoneyAmount,
        colorFn: (_, index) => colorGenerator.getColorForChartSlice(index),
        outsideLabelStyleAccessorFn: (_, __) =>
            charts.TextStyleSpec(color: charts.MaterialPalette.white),
        insideLabelStyleAccessorFn: (_, __) =>
            charts.TextStyleSpec(color: charts.MaterialPalette.white),
        labelAccessorFn: (expenses, index) =>
            expenses.name + ': ' + expenses.totalMoneyAmount.round().toString(),
      ),
    ];
  }

  double _getHeight() =>
      legend ? 350.0 + seriesList[0].data.length * 20.0 : 350.0;

  _showLegend() => [
        charts.DatumLegend(
          position: charts.BehaviorPosition.bottom,
          horizontalFirst: false,
          cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
          showMeasures: true,
          legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
          measureFormatter: (value) =>
              value == null ? '-' : '-   ' + value.toStringAsFixed(2),
        ),
      ];

  final _defaultRenderer = charts.ArcRendererConfig(arcRendererDecorators: [
    charts.ArcLabelDecorator(labelPosition: charts.ArcLabelPosition.auto)
  ]);
}
