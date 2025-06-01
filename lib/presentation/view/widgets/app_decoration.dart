import 'package:flutter/material.dart';

InputDecoration customInputDecoration({
  required BuildContext context,
  String? label,
  String? hint,
  Widget? prefixIcon,
}) {
  final theme = Theme.of(context);
  return InputDecoration(
    filled: true,
    fillColor: theme.colorScheme.surfaceContainer,
    hintText: hint,
    hintStyle: theme.textTheme.labelMedium?.copyWith(
      color: theme.colorScheme.tertiary,
    ),
    labelText: label,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    prefixIcon: prefixIcon,
    prefixIconColor: theme.colorScheme.onSurface,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  );
}

BoxDecoration customBoxDecoration(BuildContext context) {
  final theme = Theme.of(context);
  return BoxDecoration(
    color: theme.colorScheme.surfaceContainer,
    borderRadius: BorderRadius.circular(12),
  );
}
