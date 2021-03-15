import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/ui/universal_widgets/error_info.dart';
import 'package:Expenses_app/ui/universal_widgets/expenditure_item.dart';
import 'package:Expenses_app/ui/universal_widgets/loading_spinner.dart';
import 'package:Expenses_app/ui/views/list_of_expenditures/app_bar_with_filtering_options.dart';
import 'package:Expenses_app/ui/views/list_of_expenditures/list_of_expenditures_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class ListOfExpendituresView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListOfExpendituresViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBarWithFilterOptions(),
        body: Center(
          child: model.isBusy
              ? LoadingSpinner()
              : !model.hasError
                  ? model.expenditures.length > 0
                      ? ListView.builder(
                          itemCount: model.expenditures.length,
                          itemBuilder: (context, index) {
                            return buildDismissibleExpenditureItem(
                              model,
                              previousDate: index > 0
                                  ? model.expenditures[index - 1].date
                                  : null,
                              expenditure: model.expenditures[index],
                            );
                          })
                      : noItemsYetInfo
                  : ErrorInfo(model.modelError.toString()),
        ),
      ),
      onModelReady: (model) => model.fetchData(),
      viewModelBuilder: () => ListOfExpendituresViewModel(),
    );
  }

  final noItemsYetInfo =
      Container(child: Center(child: Text('No expenditures added yet')));

  Widget buildDismissibleExpenditureItem(ListOfExpendituresViewModel model,
      {DateTime previousDate, Expenditure expenditure}) {
    final expenditureWidget = Dismissible(
      onDismissed: (direction) =>
          model.deleteExpenditureAndShowSnackbar(expenditure.id),
      direction: DismissDirection.startToEnd,
      key: Key(expenditure.id.toString()),
      background: Container(
          color: Colors.red,
          padding: const EdgeInsets.only(left: 40),
          alignment: Alignment.centerLeft,
          child: const Icon(Icons.delete, size: 32)),
      child: ExpenditureItem(
        key: Key(expenditure.id.toString()),
        categoryId: expenditure.categoryId,
        title: expenditure.name,
        value: expenditure.moneyAmount,
      ),
    );

    if (shouldYouShowDateField(previousDate, expenditure.date)) {
      return Column(
        children: [
          buildDateField(expenditure.date),
          expenditureWidget,
        ],
      );
    }
    return expenditureWidget;
  }

  bool shouldYouShowDateField(
          previousDate, currentDate) =>
      (previousDate == null ||
          (DateFormat('d/M/y').format(previousDate) !=
              DateFormat('d/M/y').format(currentDate)));

  Widget buildDateField(DateTime date) => Container(
        height: 60,
        child: Center(
          child: Text(
            DateFormat('d/M/y').format(date),
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
}
