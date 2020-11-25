import 'package:Expenses_app/ui/universal_widgets/last_months_bar_chart.dart';
import 'package:Expenses_app/ui/views/trends_view/selection_fields.dart';
import 'package:Expenses_app/ui/views/trends_view/trends_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TrendsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TrendsViewModel>.reactive(
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(title: const Text('Trends')),
        body: Column(
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
        ? loadingSpinner
        : model.isDataFetched
            ? LastMonthsBarChart.buildFromData(initialData: model.data)
            : Container();
  }

  final loadingSpinner = Padding(
    padding: const EdgeInsets.symmetric(vertical: 50),
    child: Center(child: CircularProgressIndicator()),
  );
}
