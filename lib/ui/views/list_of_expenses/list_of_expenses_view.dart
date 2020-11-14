import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/services/functional_services/icons_service.dart';
import 'package:Expenses_app/ui/views/list_of_expenses/list_of_expenses_viewmodel.dart';
import 'package:Expenses_app/ui/views/list_of_expenses/short_list_of_expenses_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ListOfExpensesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListOfExpensesViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, bottom: 25),
              width: double.infinity,
              child: const Text(
                'Last Expenditures',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
              ),
            ),
            ShortListOfExpenses(),
          ],
        ),
      ),
      viewModelBuilder: () => locator<ListOfExpensesViewModel>(),
    );
  }
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
              showAllButton,
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ShortListOfExpensesViewModel(),
    );
  }

  final showAllButton = Container(
    width: double.infinity,
    height: 44,
    child: RaisedButton(
      color: Colors.red[400],
      child: Text(
        'Show All Expenditures',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {},
    ),
  );
}

class ExpenditureItem extends StatelessWidget {
  final String title;
  final double value;
  final int categoryId;

  const ExpenditureItem(
      {Key key,
      @required this.title,
      @required this.value,
      @required this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIcon(),
              buildTitle(),
              buildMoneyAmount(),
            ],
          ),
        ),
        Divider(height: 10)
      ],
    );
  }

  Widget buildIcon() => Expanded(
        flex: 1,
        child: Container(
          child: CircleAvatar(
            maxRadius: 20,
            backgroundColor: Colors.yellow[400],
            child: IconsService.getIconForCategory(categoryId),
          ),
        ),
      );

  Widget buildTitle() => Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      );

  Widget buildMoneyAmount() => Expanded(
        child: Text(
          value.toStringAsFixed(2),
          style: TextStyle(fontSize: 20, color: Colors.green[600]),
        ),
      );
}
