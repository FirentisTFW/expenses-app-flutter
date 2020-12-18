import 'package:Expenses_app/ui/universal_viewmodels/category_filter_dialog_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryFilterDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) completer;

  const CategoryFilterDialog({Key key, this.dialogRequest, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ViewModelBuilder<CategoriesViewModel>.reactive(
        builder: (context, model, chile) => Container(
          height: 200,
          child: model.isBusy
              ? Center(child: CircularProgressIndicator())
              : !model.hasError
                  ? MultiSelectDialogField(
                      items: model.data
                          .map((c) => MultiSelectItem(c.id, c.name))
                          .toList(),
                      onConfirm: (values) {
                        completer(DialogResponse(
                            confirmed: true, responseData: values));
                      },
                      listType: MultiSelectListType.LIST,
                      buttonText: Text('Choose Categories'),
                      selectedColor: Colors.red[400],
                      itemsTextStyle: TextStyle(color: Colors.white),
                      selectedItemsTextStyle: TextStyle(color: Colors.white),
                    )
                  : Container(child: Text('Errorek')),
        ),
        viewModelBuilder: () => CategoriesViewModel(),
      ),
    );
  }
}
