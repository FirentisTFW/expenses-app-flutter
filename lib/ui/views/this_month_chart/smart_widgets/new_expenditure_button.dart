import 'package:Expenses_app/ui/views/this_month_chart/smart_widgets/new_expenditure_button_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewExpenditureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewExpenditureButtonViewModel>.nonReactive(
      builder: (context, child, model) => Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(top: 30),
        child: RaisedButton(
          color: Colors.red[400],
          child: Text(
            'New Expenditure',
            style: TextStyle(fontSize: 26),
          ),
          onPressed: () {},
        ),
      ),
      viewModelBuilder: () => NewExpenditureButtonViewModel(),
    );
  }
}
