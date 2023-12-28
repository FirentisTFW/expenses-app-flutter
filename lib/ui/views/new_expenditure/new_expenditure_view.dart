import 'package:Expenses_app/services/functional_services/validator.dart';
import 'package:Expenses_app/ui/universal_viewmodels/category_filter_dialog_viewmodel.dart';
import 'package:Expenses_app/ui/universal_widgets/add_button.dart';
import 'package:Expenses_app/ui/universal_widgets/loading_spinner.dart';
import 'package:Expenses_app/ui/views/new_expenditure/new_expenditure_viewmodel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

@RoutePage()
class NewExpenditureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewExpenditureViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Nowy wydatek'),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: model.formKey,
            child: ListView(
              children: [
                _ExpendtiureNameInput(),
                _AmountInput(),
                _CategorySelection(model.setExpenditureCategory),
                _DateSelection(),
                _AddExpenditureButton(),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => NewExpenditureViewModel(),
    );
  }
}

class _ExpendtiureNameInput extends ViewModelWidget<NewExpenditureViewModel> {
  _ExpendtiureNameInput() : super(reactive: false);

  @override
  Widget build(BuildContext context, NewExpenditureViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        decoration: const InputDecoration(hintText: 'Nazwa'),
        validator: Validator.validateForEmptyString,
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.next,
        onSaved: model.setExpenditureName,
      ),
    );
  }
}

class _AmountInput extends ViewModelWidget<NewExpenditureViewModel> {
  _AmountInput() : super(reactive: false);

  @override
  Widget build(BuildContext context, NewExpenditureViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        decoration: const InputDecoration(hintText: 'Kwota'),
        keyboardType: TextInputType.number,
        validator: Validator.vaidateForNonNegativeDouble,
        textInputAction: TextInputAction.next,
        onSaved: (value) {
          final parsedValue = double.tryParse(value ?? '');
          if (parsedValue == null) return;

          model.setMoneyAmount(parsedValue);
        },
      ),
    );
  }
}

class _CategorySelection extends StatelessWidget {
  final void Function(int) onSaved;

  _CategorySelection(this.onSaved);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesViewModel>.reactive(
      builder: (_, model, __) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: model.isBusy
            ? LoadingSpinner()
            : DropdownButtonFormField(
                value: model.data!.first.id,
                items: model.data!
                    .map(
                      (category) => DropdownMenuItem(
                        value: category.id,
                        child: Text(category.name),
                      ),
                    )
                    .toList(),
                onChanged: (_) => Future.delayed(
                    Duration(
                      milliseconds: 300,
                    ),
                    () => FocusScope.of(context).unfocus()),
                onSaved: (id) {
                  if (id == null) return;
                  onSaved(id);
                },
              ),
      ),
      viewModelBuilder: () => CategoriesViewModel(),
    );
  }
}

class _DateSelection extends ViewModelWidget<NewExpenditureViewModel> {
  @override
  Widget build(BuildContext context, NewExpenditureViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        child: Text('Data: ' + DateFormat('yMd').format(model.expenditureDate),
            style: TextStyle(fontSize: 20)),
        onPressed: () {
          // FIXME Refactor this

          _showDialog(
            context,
            CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              use24hFormat: true,
              showDayOfWeek: true,
              onDateTimeChanged: model.setExpenditureDate,
            ),
          );
        },
      ),
    );
  }
}

// This function displays a CupertinoModalPopup with a reasonable fixed height
// which hosts CupertinoDatePicker.
void _showDialog(BuildContext context, Widget child) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      // The Bottom margin is provided to align the popup above the system
      // navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      // Provide a background color for the popup.
      color: CupertinoColors.systemBackground.resolveFrom(context),
      // Use a SafeArea widget to avoid system overlaps.
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}

class _AddExpenditureButton extends ViewModelWidget<NewExpenditureViewModel> {
  @override
  Widget build(BuildContext context, NewExpenditureViewModel model) {
    return model.isBusy
        ? LoadingSpinner(padding: EdgeInsets.all(20))
        : AddButton(
            onPressed: model.validateAndAddExpenditure,
            text: 'Dodaj wydatek',
          );
  }
}
