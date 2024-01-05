import 'package:Expenses_app/ui/dialogs/dialog_utils.dart';
import 'package:Expenses_app/ui/dialogs/smart_dialogs/date_filter_dialog_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DateFilterDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) completer;

  DateFilterDialog({
    super.key,
    required this.dialogRequest,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DateFilterDialogViewModel>.reactive(
      builder: (context, model, child) => Dialog(
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDatePickerButton(context, model, isFirst: true),
                    Text('-'),
                    _buildDatePickerButton(context, model),
                  ],
                ),
              ),
              _buildConfirmationButton(
                onTap: () => completer(
                  DialogResponse(
                    confirmed: true,
                    data: {
                      'startDate': model.startDate,
                      'endDate': model.endDate
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => DateFilterDialogViewModel(),
    );
  }

  Widget _buildDatePickerButton(
          BuildContext context, DateFilterDialogViewModel model,
          {bool isFirst = false}) =>
      MaterialButton(
        color: Colors.grey[600],
        padding: const EdgeInsets.all(10),
        minWidth: 100,
        child: Text(
          isFirst
              ? model.startDate != null
                  ? DateFormat('yMd').format(model.startDate!)
                  : 'Od'
              : model.endDate != null
                  ? DateFormat('yMd').format(model.endDate!)
                  : 'Do',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          _showDatePickerAndChooseDate(context, model, isFirst: isFirst);
        },
      );

  void _showDatePickerAndChooseDate(
    BuildContext context,
    DateFilterDialogViewModel model, {
    bool isFirst = false,
  }) {
    final currentDate = DateTime.now();

    DialogUtils.showModalPopup(
      context,
      CupertinoDatePicker(
        initialDateTime: currentDate,
        maximumDate: currentDate,
        maximumYear: currentDate.year,
        mode: CupertinoDatePickerMode.date,
        showDayOfWeek: true,
        onDateTimeChanged: isFirst ? model.setStartDate : model.setEndDate,
      ),
    );
  }

  Widget _buildConfirmationButton({
    required VoidCallback onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          child: Text(
            dialogRequest.mainButtonTitle ?? '',
            style: TextStyle(fontSize: 20),
          ),
          decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: BorderRadius.circular(5),
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
        ),
      );
}
