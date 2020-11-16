import 'package:Expenses_app/ui/universal_widgets/expenditure_item.dart';
import 'package:Expenses_app/ui/views/list_of_expenditures/list_of_expenditures_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ListOfExpendituresView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListOfExpendituresViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: model.isBusy
              ? Center(child: CircularProgressIndicator())
              : !model.hasError
                  ? ListView.builder(
                      itemCount: model.data.length,
                      itemBuilder: (context, index) => ExpenditureItem(
                            categoryId: model.data[index].categoryId,
                            title: model.data[index].name,
                            value: model.data[index].moneyAmount,
                          ))
                  : Container(
                      child: Text('err'),
                      // TODO: show error dialog
                    ),
        ),
      ),
      viewModelBuilder: () => ListOfExpendituresViewModel(),
    );
  }
}
