import 'package:Expenses_app/ui/universal_viewmodels/category_filter_dialog_viewmodel.dart';
import 'package:Expenses_app/ui/universal_widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryFilterDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) completer;

  const CategoryFilterDialog({
    super.key,
    required this.dialogRequest,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ViewModelBuilder<CategoriesViewModel>.reactive(
        builder: (context, model, chile) => Container(
          height: 200,
          child: model.isBusy
              ? LoadingSpinner()
              : !model.hasError
                  ? MultiSelectDialogField(
                      items: (model.data ?? [])
                          .map((c) => MultiSelectItem(c.id, c.name))
                          .toList(),
                      onConfirm: (values) {
                        completer(
                          DialogResponse(
                            confirmed: true,
                            data: values,
                          ),
                        );
                      },
                      listType: MultiSelectListType.LIST,
                      buttonText: Text('Wybierz kategorie'),
                      selectedColor: Colors.red[400],
                      itemsTextStyle: TextStyle(color: Colors.white),
                      selectedItemsTextStyle: TextStyle(color: Colors.white),
                    )
                  : Container(child: Text('Wystąpił błąd')),
        ),
        viewModelBuilder: () => CategoriesViewModel(),
      ),
    );
  }
}
