import 'package:Expenses_app/services/functional_services/icons_service.dart';
import 'package:Expenses_app/services/functional_services/validator.dart';
import 'package:Expenses_app/ui/views/new_category/new_category_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewCategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Add New Category')),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: model.formKey,
            child: ListView(
              children: [
                _CategoryNameInput(),
                _IconSelection(),
                _AddCategoryButton(),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => NewCategoryViewModel(),
    );
  }
}

class _CategoryNameInput extends ViewModelWidget<NewCategoryViewModel> {
  _CategoryNameInput() : super(reactive: false);

  @override
  Widget build(BuildContext context, NewCategoryViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Name'),
        validator: Validator.validateForEmptyString,
        textCapitalization: TextCapitalization.sentences,
        onSaved: model.setCategoryName,
      ),
    );
  }
}

class _IconSelection extends ViewModelWidget<NewCategoryViewModel> {
  _IconSelection() : super(reactive: false);

  @override
  Widget build(BuildContext context, NewCategoryViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: DropdownButtonFormField(
        value: 0,
        items: [
          for (int i = 0; i < IconsService.numberOfIcons; i++)
            ...{
              DropdownMenuItem(
                  value: i,
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.yellow[400],
                    child: IconsService.getIconForId(i),
                  )),
            }.toList()
        ],
        onChanged: model.setIconId,
      ),
    );
  }
}

class _AddCategoryButton extends ViewModelWidget<NewCategoryViewModel> {
  @override
  Widget build(BuildContext context, NewCategoryViewModel model) {
    return model.isBusy
        ? loadingSpinner
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: RaisedButton(
              color: Colors.red[400],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Add Category',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              onPressed: model.validateAndAddCategory,
            ),
          );
  }

  final loadingSpinner = Padding(
      padding: const EdgeInsets.all(20),
      child: Center(child: CircularProgressIndicator()));
}
