import 'package:Expenses_app/ui/views/trends_view/trends_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class TrendsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TrendsViewModel>.reactive(
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(title: const Text('Trends')),
        body: Container(
          height: 200,
          child: _SelectionFields(),
        ),
      ),
      viewModelBuilder: () => TrendsViewModel(),
    );
  }
}

class _SelectionFields extends ViewModelWidget<TrendsViewModel> {
  @override
  Widget build(BuildContext context, TrendsViewModel model) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            groupByFormField,
            SizedBox(height: 10),
            _DateSelectionFields(),
            showChartButton,
          ],
        ),
      ),
    );
  }

  final groupByFormField = DropdownButtonFormField(
    value: 'months',
    items: [
      DropdownMenuItem(
        value: 'months',
        child: Text('By Months'),
      ),
      DropdownMenuItem(
        value: 'categories',
        child: Text('By Categories'),
      ),
    ],
    onChanged: (value) {},
  );

  final showChartButton = Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      height: 40,
      width: double.infinity,
      child: FlatButton(
        color: Colors.grey[600],
        child: Text('Show Chart'),
        onPressed: () {},
      ),
    ),
  );
}

class _DateSelectionFields extends ViewModelWidget<TrendsViewModel> {
  const _DateSelectionFields({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, TrendsViewModel model) {
    return Row(
      children: [
        buildMonthsList(model, startFromThisMonth: false),
        SizedBox(width: 20),
        buildMonthsList(model, startFromThisMonth: true),
      ],
    );
  }

  buildMonthsList(TrendsViewModel model, {bool startFromThisMonth}) {
    final monthsList = model.getMonthsForList();
    final initialValue = startFromThisMonth
        ? monthsList[0].toLowerCase().replaceAll(' ', '_')
        : monthsList[5].toLowerCase().replaceAll(' ', '_');

    return Expanded(
      child: DropdownButtonFormField(
        value: initialValue,
        items: [
          for (String month in monthsList)
            ...{
              DropdownMenuItem(
                value: month.toLowerCase().replaceAll(' ', '_'),
                child: Text(month),
              ),
            }.toList()
        ],
        onChanged: (value) {},
      ),
    );
  }
}
