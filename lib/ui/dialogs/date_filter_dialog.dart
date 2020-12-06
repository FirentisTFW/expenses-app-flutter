import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:intl/intl.dart';

class DateFilterDialog extends StatefulWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) completer;

  DateFilterDialog({Key key, this.dialogRequest, this.completer})
      : super(key: key);

  @override
  _DateFilterDialogState createState() => _DateFilterDialogState();
}

class _DateFilterDialogState extends State<DateFilterDialog> {
  DateTime startDate;
  DateTime endDate;

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                  _buildDatePickerButton(isFirst: true),
                  Text('-'),
                  _buildDatePickerButton(),
                ],
              ),
            ),
            _buildConfirmationButton(
              onTap: () => widget.completer(DialogResponse(
                  confirmed: true,
                  responseData: {'startDate': startDate, 'endDate': endDate})),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePickerButton({bool isFirst = false}) => FlatButton(
        color: Colors.grey[600],
        padding: const EdgeInsets.all(10),
        minWidth: 100,
        child: Text(
          isFirst
              ? startDate != null
                  ? DateFormat('yMd').format(startDate)
                  : 'From'
              : endDate != null
                  ? DateFormat('yMd').format(endDate)
                  : 'To',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          _showDatePickerAndChooseDate(isFirst: isFirst);
        },
      );

  void _showDatePickerAndChooseDate({bool isFirst = false}) {
    DatePicker.showDatePicker(
      context,
      currentTime: DateTime.now().subtract(Duration(days: 60)),
      maxTime: DateTime.now(),
      theme: DatePickerTheme(
        backgroundColor: Theme.of(context).primaryColor,
        itemHeight: 40,
        itemStyle: TextStyle(color: Colors.white),
        cancelStyle: TextStyle(color: Colors.grey[400], fontSize: 22),
        doneStyle: TextStyle(color: Colors.red[400], fontSize: 22),
      ),
      onConfirm: (value) {
        isFirst
            ? setState(() {
                startDate = value;
              })
            : setState(() {
                endDate = value;
              });
      },
    );
  }

  Widget _buildConfirmationButton({Function onTap}) => GestureDetector(
        onTap: onTap,
        child: Container(
          child: Text(
            widget.dialogRequest.mainButtonTitle,
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
