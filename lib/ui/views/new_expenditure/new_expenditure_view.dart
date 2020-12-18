import 'package:Expenses_app/datamodels/category.dart';
import 'package:Expenses_app/ui/universal_viewmodels/category_filter_dialog_viewmodel.dart';
import 'package:Expenses_app/ui/views/new_expenditure/new_expenditure_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class NewExpenditureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewExpenditureViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Add New Expenditure'),
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
        decoration: InputDecoration(hintText: 'Name'),
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
        decoration: InputDecoration(hintText: 'Amount'),
        keyboardType: TextInputType.number,
        onSaved: model.setExpenditureName,
      ),
    );
  }
}

class _CategorySelection extends StatelessWidget {
  final Function(int) onSaved;

  _CategorySelection(this.onSaved);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesViewModel>.reactive(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: model.isBusy
            ? Center(child: CircularProgressIndicator())
            : DropdownButtonFormField(
                value: 0,
                items: [
                  for (Category category in model.data)
                    ...{
                      DropdownMenuItem(
                        value: category.id,
                        child: Text(category.name),
                      ),
                    }.toList()
                ],
                onChanged: (_) {},
                onSaved: onSaved,
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
      child: FlatButton(
        child: Text(
            model.isDateSet
                ? DateFormat('yMd').format(model.expenditureDate)
                : 'Choose Date',
            style: TextStyle(fontSize: 18)),
        onPressed: () => DatePicker.showDatePicker(
          context,
          currentTime: DateTime.now(),
          maxTime: DateTime.now(),
          theme: DatePickerTheme(
            backgroundColor: Theme.of(context).primaryColor,
            itemHeight: 40,
            itemStyle: TextStyle(color: Colors.white),
            cancelStyle: TextStyle(color: Colors.grey[400], fontSize: 22),
            doneStyle: TextStyle(color: Colors.red[400], fontSize: 22),
          ),
          onConfirm: model.setExpenditureDate,
        ),
      ),
    );
  }
}

class _AddExpenditureButton extends ViewModelWidget<NewExpenditureViewModel> {
  _AddExpenditureButton() : super(reactive: false);

  @override
  Widget build(BuildContext context, NewExpenditureViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: RaisedButton(
        color: Colors.red[400],
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Add Expenditure',
            style: TextStyle(fontSize: 22),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
