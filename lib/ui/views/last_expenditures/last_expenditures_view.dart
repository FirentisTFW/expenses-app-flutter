import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/ui/universal_widgets/expenditure_item.dart';
import 'package:Expenses_app/ui/views/last_expenditures/last_expenditures_viewmodel.dart';
import 'package:Expenses_app/ui/views/last_expenditures/short_list_of_expenses_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LastExpendituresView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LastExpendituresViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            title,
            ShortListOfExpenses(),
          ],
        ),
      ),
      viewModelBuilder: () => locator<LastExpendituresViewModel>(),
    );
  }

  final title = Container(
    padding: const EdgeInsets.only(top: 50, bottom: 25),
    width: double.infinity,
    child: const Text(
      'Last Expenditures',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 28),
    ),
  );
}

class ShortListOfExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShortListOfExpensesViewModel>.reactive(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Card(
          child: Column(
            children: [
              Container(
                height: 300,
                child: model.isBusy
                    ? Center(child: CircularProgressIndicator())
                    : !model.hasError
                        ? ListView(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            children: model.data
                                .map((item) => ExpenditureItem(
                                      categoryId: item.categoryId,
                                      title: item.name,
                                      value: item.moneyAmount,
                                    ))
                                .toList())
                        : Container(
                            child: Text('err'),
                            // TODO: show error dialog
                          ),
              ),
              _ShowAllButton(),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ShortListOfExpensesViewModel(),
    );
  }
}

class _ShowAllButton extends ViewModelWidget<ShortListOfExpensesViewModel> {
  _ShowAllButton({Key key}) : super(key: key, reactive: false);

  Widget build(BuildContext context, ShortListOfExpensesViewModel model) {
    return Container(
      width: double.infinity,
      height: 44,
      child: RaisedButton(
        color: Colors.red[400],
        child: Text(
          'Show All Expenditures',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: model.goToListOfExpansesView,
      ),
    );
  }
}
