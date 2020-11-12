import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/services/functional_services/icons_service.dart';
import 'package:Expenses_app/ui/views/list_of_expenses/list_of_expenses_viewmodel.dart';
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
            ListOfExpenses(),
          ],
        ),
      ),
      viewModelBuilder: () => locator<ListOfExpensesViewModel>(),
    );
  }
}

class ListOfExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        child: Column(
          children: [
            Container(
              height: 300,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 6),
                children: [
                  ExpenditureItem(
                    title: 'Rent',
                    value: 1600.00,
                    categoryId: 0,
                  ),
                  ExpenditureItem(
                    title: 'Bills',
                    value: 187.50,
                    categoryId: 2,
                  ),
                  ExpenditureItem(
                    title: 'Clothes',
                    value: 256.57,
                    categoryId: 6,
                  ),
                  ExpenditureItem(
                    title: 'Groceries',
                    value: 142.22,
                    categoryId: 13,
                  ),
                ],
              ),
            ),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
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
              Expanded(
                flex: 1,
                child: Container(
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.yellow[400],
                    child: IconsService.getIconForCategory(categoryId),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  value.toStringAsFixed(2),
                  style: TextStyle(fontSize: 20, color: Colors.green[600]),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 10,
        )
      ],
    );
  }
}
