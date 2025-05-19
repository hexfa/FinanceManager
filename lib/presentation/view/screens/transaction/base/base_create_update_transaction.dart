import 'package:finance_manager/presentation/view/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_state.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:finance_manager/presentation/view/widgets/button/custom_button.dart';
import 'package:finance_manager/presentation/view/widgets/choice_chip/custom_type_selector.dart';
import 'package:finance_manager/presentation/view/widgets/datetime/custom_date_picker.dart';
import 'package:finance_manager/presentation/view/widgets/dropdown/custom_drop_down.dart';
import 'package:finance_manager/presentation/view/widgets/textfield/custom_text_field.dart';

abstract class BaseTransactionScreen extends StatefulWidget {
  const BaseTransactionScreen({super.key});

  String get appBarTitle;

  String get actionButtonText;
}

abstract class BaseTransactionScreenState<T extends BaseTransactionScreen>
    extends BaseState<T> {
  late TextEditingController titleController;
  late TextEditingController amountController;

  VoidCallback get onActionPressed;

  String get categoryLabel;

  DateTime get dateLabel;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    amountController = TextEditingController();

    titleController.addListener(() {
      getBloc<TransactionCubit>().updateTitle(titleController.text);
    });
    amountController.addListener(() {
      getBloc<TransactionCubit>().updateAmount(amountController.text);
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.appBarTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            CustomTextField(label: 'Title', controller: titleController),
            const SizedBox(height: 16),
            CustomTextField(
              isCurrency: true,
              label: 'Amount',
              controller: amountController,
            ),
            const SizedBox(height: 16),
            CustomDropdown(
              label: categoryLabel,
              items: ['Business', 'Food', 'Sport', 'Education', 'Other'],
              onChanged: (value) {
                getBloc<TransactionCubit>().updateCategory(value ?? '');
              },
            ),
            const SizedBox(height: 16),
            DateTimePickerContainer(
              initialDateTime: dateLabel,
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
                  text: widget.actionButtonText,
                  onPressed: isFormValid ? onActionPressed : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
