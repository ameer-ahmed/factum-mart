import 'package:flutter/material.dart';

class FactumMartSubmitButton extends StatelessWidget {
  const FactumMartSubmitButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final Function? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red,
      ),
      child: MaterialButton(
        onPressed: () => onPressed,
        child: Text(
          text!,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
