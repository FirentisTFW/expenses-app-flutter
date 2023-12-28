import 'package:Expenses_app/ui/views/this_month_chart/this_month_chart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewExpenditureButton extends ViewModelWidget<ThisMonthChartViewModel> {
  NewExpenditureButton({super.key}) : super(reactive: false);

  @override
  Widget build(BuildContext context, ThisMonthChartViewModel model) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 30),
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.red[400],
        child: const Text(
          'Nowy wydatek',
          style: TextStyle(fontSize: 26),
        ),
        onPressed: model.goToNewExpenditureView,
      ),
    );
  }
}
