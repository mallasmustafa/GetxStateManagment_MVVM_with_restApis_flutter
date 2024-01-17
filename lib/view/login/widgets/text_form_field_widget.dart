
import 'package:flutter/material.dart';
import 'package:getx_statemanagment_mvvm/utils/utils.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Key formKey;
  final String snackBarMessage;
  final String snackBarTittle;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final String hintText;
 final bool obscureText;
   const TextFormFieldWidget({
    super.key,
    required this.formKey,
    required this.snackBarMessage,
    required this.snackBarTittle,
    required this.controller,
    required this.focusNode,
    required this.currentFocus,
    required this.nextFocus, required this.hintText,
    this.obscureText=false,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            obscureText: obscureText,
            validator: (value) {
              if (value!.isEmpty) {
                Utils.snackBar(snackBarMessage, snackBarTittle);
              }
              return null;
            },
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(context, currentFocus, nextFocus);
            },
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
