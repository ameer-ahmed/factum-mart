import 'package:flutter/material.dart';

void navigateTo({
  required context,
  required widget,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

void navigateAndKill({
  required context,
  required widget,
}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}
