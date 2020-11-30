import 'package:Expenses_app/ui/views/this_month_chart/smart_widgets/new_category_button_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewCategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewCategoryButtonViewModel>.nonReactive(
      builder: (context, child, model) => Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.only(top: 30),
        child: RaisedButton(
          color: Colors.red[400],
          child: Text(
            'New Category',
            style: TextStyle(fontSize: 22),
          ),
          onPressed: () {},
        ),
      ),
      viewModelBuilder: () => NewCategoryButtonViewModel(),
    );
  }
}
