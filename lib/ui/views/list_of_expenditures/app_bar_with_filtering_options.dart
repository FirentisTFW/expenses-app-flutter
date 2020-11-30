import 'package:Expenses_app/datamodels/enums/filtering_method.dart';
import 'package:Expenses_app/ui/views/list_of_expenditures/list_of_expenditures_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AppBarWithFilterOptions
    extends ViewModelWidget<ListOfExpendituresViewModel>
    implements PreferredSizeWidget {
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, ListOfExpendituresViewModel model) {
    return AppBar(
      actions: [
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          onSelected: model.showFilteringOptions,
          itemBuilder: (_) => [
            PopupMenuItem(
              child: Text('Filter by price'),
              value: FilteringMethod.ByPrice,
            ),
            PopupMenuItem(
              child: Text('Filter by category'),
              value: FilteringMethod.ByCategory,
            ),
            PopupMenuItem(
              child: Text('Filter by date'),
              value: FilteringMethod.ByDate,
            ),
          ],
        )
      ],
    );
  }
}
