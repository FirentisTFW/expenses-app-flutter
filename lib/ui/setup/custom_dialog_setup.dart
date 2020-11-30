import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/enums/dialog_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUI() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.PriceFilter: (context, request, completer) =>
        _PriceFilterDialog(dialogRequest: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _PriceFilterDialog extends HookWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) completer;

  const _PriceFilterDialog({Key key, this.dialogRequest, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = useTextEditingController();
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dialogRequest.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () =>
                  completer(DialogResponse(responseData: [controller.text])),
              child: Container(
                child: dialogRequest.showIconInMainButton
                    ? Icon(Icons.check_circle)
                    : Text(dialogRequest.mainButtonTitle),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
