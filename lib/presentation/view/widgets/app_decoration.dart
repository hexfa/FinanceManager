import 'package:flutter/material.dart';

InputDecoration customInputDecoration({
  required BuildContext context,
  String? label,
  Widget? prefixIcon,
}) {
  final theme = Theme.of(context);
  return InputDecoration(
    filled: true,
    fillColor: theme.colorScheme.surface,
    labelText: label,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: theme.colorScheme.tertiary),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: theme.colorScheme.primary),
      borderRadius: BorderRadius.circular(8),
    ),
    prefixIcon: prefixIcon,
  );
}

BoxDecoration customBoxDecoration(BuildContext context) {
  final theme = Theme.of(context);
  return BoxDecoration(
    color: theme.colorScheme.surface,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: theme.colorScheme.tertiary),
  );
}
