import 'package:charts_flutter/flutter.dart' as charts;

class ChartColorGenerator {
  List<charts.Color> _colors;

  ChartColorGenerator(this._colors);

  charts.Color getColorForChartSlice(dynamic _, int index) => _colors[index];

  factory ChartColorGenerator.buildWithSampleColors() {
    return ChartColorGenerator([
      charts.MaterialPalette.red.shadeDefault.darker,
      charts.MaterialPalette.green.shadeDefault.darker,
      charts.MaterialPalette.blue.shadeDefault.darker,
      charts.MaterialPalette.yellow.shadeDefault.darker,
      charts.MaterialPalette.cyan.shadeDefault.darker,
      charts.MaterialPalette.teal.shadeDefault.darker,
      charts.MaterialPalette.deepOrange.shadeDefault,
      charts.MaterialPalette.indigo.shadeDefault,
      charts.MaterialPalette.gray.shadeDefault.darker,
      charts.MaterialPalette.purple.shadeDefault.darker,
      charts.MaterialPalette.red.shadeDefault.lighter,
      charts.MaterialPalette.green.shadeDefault.lighter,
      charts.MaterialPalette.blue.shadeDefault.lighter,
      charts.MaterialPalette.yellow.shadeDefault.lighter,
      charts.MaterialPalette.cyan.shadeDefault.lighter,
      charts.MaterialPalette.teal.shadeDefault.lighter,
      charts.MaterialPalette.deepOrange.shadeDefault.lighter,
      charts.MaterialPalette.indigo.shadeDefault.lighter,
      charts.MaterialPalette.gray.shadeDefault.lighter,
      charts.MaterialPalette.purple.shadeDefault.lighter,
      charts.MaterialPalette.red.shadeDefault,
      charts.MaterialPalette.green.shadeDefault,
      charts.MaterialPalette.blue.shadeDefault,
      charts.MaterialPalette.yellow.shadeDefault,
      charts.MaterialPalette.cyan.shadeDefault,
      charts.MaterialPalette.teal.shadeDefault,
      charts.MaterialPalette.deepOrange.shadeDefault,
      charts.MaterialPalette.indigo.shadeDefault,
      charts.MaterialPalette.gray.shadeDefault,
      charts.MaterialPalette.purple.shadeDefault,
    ]);
  }
}
