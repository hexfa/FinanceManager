import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_state.dart';
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

    _amountController.addListener(() {
      getBloc<TransactionCubit>().updateAmount(_amountController.text);
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
    return Scaffold(
      appBar: CustomAppBar(title: localization.addTransaction),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            // title
            CustomTextField(
              label: localization.title,
              controller: _titleController,
            ),
            const SizedBox(height: 16),
            // amount
            CustomTextField(
              isCurrency: true,
              label: localization.amount,
              controller: _amountController,
            ),
            const SizedBox(height: 16),
            CustomDropdown(
              label: localization.category,
              items: ['Work', 'Sport', 'Education', 'Other'],
              onChanged: (value) {
                getBloc<TransactionCubit>().updateCategory(value ?? '');
              },
            ),
            const SizedBox(height: 16),
            DateTimePickerContainer(
              onDateTimeSelected: (selectedDateTime) {
                getBloc<TransactionCubit>().updateDate(selectedDateTime);
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<TransactionCubit, TransactionState>(
              builder: (context, state) {
                return CustomTypeSelector(
                  selectedType: state.type,
                  onChanged: (type) {
                    getBloc<TransactionCubit>().updateType(type);
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<TransactionCubit, TransactionState>(
              builder: (context, state) {
                final isFormValid =
                    state.title.isNotEmpty &&
                    state.amount.isNotEmpty &&
                    state.category.isNotEmpty;

                return CustomButton(
                  text: localization.ok,
                  onPressed:
                      isFormValid
                          ? () {
                            getBloc<TransactionCubit>().createTransaction();
                            navigator.pop(context);
                          }
                          : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
