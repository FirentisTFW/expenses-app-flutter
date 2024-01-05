import 'package:Expenses_app/services/functional_services/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

class PriceFilterDialog extends HookWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) completer;

  const PriceFilterDialog({
    super.key,
    required this.dialogRequest,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    var controllerMin = useTextEditingController();
    var controllerMax = useTextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dialogRequest.title ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        _buildTextField(controllerMin, 'Min'),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(' - ', style: TextStyle(fontSize: 26))),
                        _buildTextField(controllerMax, 'Max'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildConfirmationButton(onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      completer(
                        DialogResponse(
                          confirmed: true,
                          data: {
                            'min': controllerMin.text,
                            'max': controllerMax.text,
                          },
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) =>
      Expanded(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(hintText: hintText),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          validator: Validator.vaidateForNonNegativeDouble,
        ),
      );

  Widget _buildConfirmationButton({
    required VoidCallback onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          child: dialogRequest.showIconInMainButton ?? false
              ? Icon(Icons.check_circle)
              : Text(
                  dialogRequest.mainButtonTitle ?? '',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      );
}
