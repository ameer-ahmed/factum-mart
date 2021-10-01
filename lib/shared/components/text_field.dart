import 'package:flutter/material.dart';

class FactumMartTextField extends StatelessWidget {
  const FactumMartTextField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    this.prefixIcon,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? labelText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required field.';
        }
        return null;
      },
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        labelText: labelText,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
      ),
      obscureText: textInputType == TextInputType.visiblePassword ? true : false,
    );
  }
}
