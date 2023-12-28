import 'package:Expenses_app/ui/views/this_month_chart/this_month_chart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewCategoryButton extends ViewModelWidget<ThisMonthChartViewModel> {
  NewCategoryButton({super.key}) : super(reactive: false);

  @override
  Widget build(BuildContext context, ThisMonthChartViewModel model) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.red[400],
        child: const Text(
          'Nowa kategoria',
          style: TextStyle(fontSize: 22),
        ),
        onPressed: model.goToNewCategoryView,
      ),
    );
  }
}
