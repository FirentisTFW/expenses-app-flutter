import 'package:Expenses_app/datamodels/enums/grouping_method.dart';
import 'package:Expenses_app/ui/views/trends/trends_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class SelectionFields extends ViewModelWidget<TrendsViewModel> {
  SelectionFields({Key key}) : super(key: key, reactive: false);

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
  _GroupingSelectionField({Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, TrendsViewModel model) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField(
        value: GroupingMethod.ByCategories,
        items: [
          const DropdownMenuItem(
            value: GroupingMethod.ByCategories,
            child: const Text('By Categories'),
          ),
          const DropdownMenuItem(
            value: GroupingMethod.ByMonths,
            child: const Text('By Months'),
          ),
        ],
        onChanged: (value) {},
        onSaved: model.setGroupingMethod,
      ),
    );
  }
}

class _DateSelectionFields extends ViewModelWidget<TrendsViewModel> {
  _DateSelectionFields({
    Key key,
  }) : super(key: key, reactive: false);

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

  buildMonthsList(TrendsViewModel model, {bool firstDate}) {
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
  const _ShowChartButton({
    Key key,
  }) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, TrendsViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 40,
        width: double.infinity,
        child: FlatButton(
          color: Colors.grey[600],
          child: const Text('Show Chart'),
          onPressed: model.saveForm,
        ),
      ),
    );
  }
}
