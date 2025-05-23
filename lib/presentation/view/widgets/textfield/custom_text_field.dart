import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:finance_manager/presentation/view/widgets/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends BaseStatelessWidget {
  final String label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool isCurrency;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    this.isCurrency = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (text) {
        if (isCurrency && controller != null) {
          _handleCurrency(text);
        } else {
          if (onChanged != null) {
            onChanged!(text);
          }
        }
      },
      keyboardType:
          isCurrency
              ? TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
      inputFormatters:
          isCurrency ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: customInputDecoration(
        context: context,
        label: label,
        prefixIcon: isCurrency ? Icon(Icons.attach_money) : null,
      ),
    );
  }

  void _handleCurrency(String text) {
    final rawText = text.replaceAll(',', '');
    final formattedText = ConvertString.formatCurrencyFromString(rawText);

    final oldSelection = controller!.selection;
    final newSelectionIndex =
        formattedText.length - (rawText.length - oldSelection.baseOffset);

    controller!.value = TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: newSelectionIndex.clamp(0, formattedText.length),
      ),
    );

    if (onChanged != null) {
      onChanged!(formattedText);
    }
  }
}
