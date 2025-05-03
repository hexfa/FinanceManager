import 'package:finance_manager/presentation/view/base/base_state.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:finance_manager/presentation/view/widgets/dropdown/custom_drop_down.dart';
import 'package:finance_manager/presentation/view/widgets/textfield/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends BaseState<AddTransaction> {
  late TextEditingController _titleController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'AddTransaction'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            CustomTextField(
              label: 'Title',
              controller: _titleController,
              onChanged: (text) {
                showSnackBar(text);
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              isCurrency: true,
              label: 'Amount',
              controller: _amountController,
              onChanged: (text) {
                showSnackBar(text);
              },
            ),
            const SizedBox(height: 16),
            CustomDropdown(
              label: 'Category',
              items: ['Work', 'Sport', 'Education', 'Other'],
              onChanged: (value) {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
