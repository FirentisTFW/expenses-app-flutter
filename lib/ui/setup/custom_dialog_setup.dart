import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/enums/dialog_type.dart';
import 'package:Expenses_app/ui/dialogs/smart_dialogs/date_filter_dialog.dart';
import 'package:Expenses_app/ui/dialogs/price_filter_dialog.dart';
import 'package:Expenses_app/ui/dialogs/smart_dialogs/category_filter_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUI() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.PriceFilter: (context, request, completer) =>
        PriceFilterDialog(dialogRequest: request, completer: completer),
    DialogType.CategoryFilter: (context, request, completer) =>
        CategoryFilterDialog(dialogRequest: request, completer: completer),
    DialogType.DateFilter: (context, request, completer) =>
        DateFilterDialog(dialogRequest: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
