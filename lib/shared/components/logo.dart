import 'package:flutter/material.dart';

class FactumMartLogo extends StatelessWidget {
  const FactumMartLogo({
    Key? key,
    required this.textScaleFactor,
    required this.alignment,
  }) : super(key: key);
  final double? textScaleFactor;
  final MainAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment!,
      children: [
        Text(
          'Factum',
          textScaleFactor: textScaleFactor!,
          style: const TextStyle(
            color: Colors.black,
            // fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '.',
          textScaleFactor: textScaleFactor! + 0.35,
          style: const TextStyle(
            // fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        Text(
          'Mart',
          textScaleFactor: textScaleFactor!,
          style: const TextStyle(
            color: Colors.black,
            // fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
