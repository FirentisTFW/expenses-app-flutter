import 'package:Expenses_app/ui/universal_widgets/expenditure_item.dart';
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
              ? Center(child: CircularProgressIndicator())
              : !model.hasError
                  ? model.data.length > 0
                      ? ListView.builder(
                          itemCount: model.data.length,
                          itemBuilder: (context, index) {
                            return buildExpenditureItem(
                              previousDate:
                                  index > 0 ? model.data[index - 1].date : null,
                              currentDate: model.data[index].date,
                              categoryId: model.data[index].categoryId,
                              title: model.data[index].name,
                              value: model.data[index].moneyAmount,
                            );
                          })
                      : noItemsYetInfo
                  : Container(
                      child: Text('err'),
                      // TODO: show error dialog
                    ),
        ),
      ),
      viewModelBuilder: () => ListOfExpendituresViewModel(),
    );
  }

  final noItemsYetInfo =
      Container(child: Center(child: Text('No expenditures added yet')));

  Widget buildExpenditureItem(
      {previousDate, currentDate, categoryId, title, value}) {
    final expenditureWidget = ExpenditureItem(
      categoryId: categoryId,
      title: title,
      value: value,
    );

    if (shouldYouShowDateField(previousDate, currentDate)) {
      return Column(
        children: [
          buildDateField(currentDate),
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
