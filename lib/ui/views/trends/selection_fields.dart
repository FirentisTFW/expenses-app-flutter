import 'package:Expenses_app/datamodels/enums/grouping_method.dart';
import 'package:Expenses_app/ui/views/trends/trends_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class SelectionFields extends ViewModelWidget<TrendsViewModel> {
  SelectionFields({super.key}) : super(reactive: false);

  @override
  Widget build(BuildContext context, TrendsViewModel model) {
    return Container(
      height: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: model.formKey,
            child: Column(
              children: [
                _GroupingSelectionField(),
                _DateSelectionFields(),
                const _ShowChartButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GroupingSelectionField extends ViewModelWidget<TrendsViewModel> {
  _GroupingSelectionField() : super(reactive: false);

  @override
  Widget build(BuildContext context, TrendsViewModel model) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField(
        value: model.groupingMethod,
        items: [
          const DropdownMenuItem(
            value: GroupingMethod.ByCategories,
            child: const Text('Kategorie'),
          ),
          const DropdownMenuItem(
            value: GroupingMethod.ByMonths,
            child: const Text('Miesiące'),
          ),
        ],
        onChanged: (value) {},
        onSaved: model.setGroupingMethod,
      ),
    );
  }
}

class _DateSelectionFields extends ViewModelWidget<TrendsViewModel> {
  _DateSelectionFields() : super(reactive: false);

  @override
  Widget build(BuildContext context, TrendsViewModel model) {
    return Row(
      children: [
        buildMonthsList(model, firstDate: false),
        SizedBox(width: 20),
        buildMonthsList(model, firstDate: true),
      ],
    );
  }

  buildMonthsList(
    TrendsViewModel model, {
    required bool firstDate,
  }) {
    final monthsList = model.getMonthsForList();
    final initialValue = firstDate ? monthsList[0] : monthsList[5];

    return Expanded(
      child: DropdownButtonFormField(
        value: initialValue,
        items: [
          for (DateTime month in monthsList)
            ...{
              DropdownMenuItem(
                value: month,
                child: Text(DateFormat.yMMMM().format(month)),
              ),
            }.toList()
        ],
        onChanged: (value) {},
        onSaved: firstDate ? model.setFirstDate : model.setSecondDate,
      ),
    );
  }
}

class _ShowChartButton extends ViewModelWidget<TrendsViewModel> {
  const _ShowChartButton() : super(reactive: false);

  @override
  Widget build(BuildContext context, TrendsViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 40,
        width: double.infinity,
        child: MaterialButton(
          color: Colors.grey[600],
          child: const Text('Pokaż wykres'),
          onPressed: model.saveForm,
        ),
      ),
    );
  }
}
