import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/view/base/base_state.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:finance_manager/presentation/view/widgets/button/custom_button.dart';
import 'package:finance_manager/presentation/view/widgets/choice_chip/custom_type_selector.dart';
import 'package:finance_manager/presentation/view/widgets/datetime/custom_date_picker.dart';
import 'package:finance_manager/presentation/view/widgets/dropdown/custom_drop_down.dart';
import 'package:finance_manager/presentation/view/widgets/textfield/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends BaseState<AddTransaction> {
  late TextEditingController _titleController;
  late TextEditingController _amountController;
  TransactionType? selectedType;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _amountController = TextEditingController();

    _titleController.addListener(() {
      getBloc<TransactionCubit>().updateTitle(_titleController.text);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: localization.addTransaction),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              CustomTextField(
                label: localization.title,
                controller: _titleController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                isCurrency: true,
                label: localization.amount,
                controller: _amountController,
                onChanged: (text) {
                  showSnackBar(text);
                },
              ),
              const SizedBox(height: 16),
              CustomDropdown(
                label: localization.category,
                items: ['Work', 'Sport', 'Education', 'Other'],
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              DateTimePickerContainer(
                onDateTimeSelected: (selectedDateTime) {
                  print("Selected: $selectedDateTime");
                },
              ),
              const SizedBox(height: 16),
              CustomTypeSelector(
                selectedType: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomButton(text: localization.ok, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
