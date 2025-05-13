import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class CustomConfirmDialog extends BaseStatelessWidget {
  final String title;
  final String content;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback onConfirm;

  const CustomConfirmDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmText,
    this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => navigator(context).pop(),
          child: Text(cancelText ?? 'Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            navigator(context).pop();
            onConfirm();
          },
          child: Text(confirmText ?? 'OK'),
        ),
      ],
    );
  }
}
