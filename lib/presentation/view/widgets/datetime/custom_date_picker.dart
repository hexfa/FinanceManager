import 'package:finance_manager/presentation/view/base/base_state.dart';
import 'package:finance_manager/presentation/view/widgets/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerContainer extends StatefulWidget {
  final ValueChanged<DateTime> onDateTimeSelected;

  const DateTimePickerContainer({super.key, required this.onDateTimeSelected});

  @override
  State<DateTimePickerContainer> createState() =>
      _DateTimePickerContainerState();
}

class _DateTimePickerContainerState extends BaseState<DateTimePickerContainer> {
  DateTime? selectedDateTime;

  Future<void> _pickDateTime(BuildContext context) async {
    final now = DateTime.now();

    final date = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDateTime ?? now),
    );

    if (time == null) return;

    final fullDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    setState(() {
      selectedDateTime = fullDateTime;
    });

    widget.onDateTimeSelected(fullDateTime);
  }

  @override
  Widget build(BuildContext context) {
    final displayText =
        selectedDateTime != null
            ? DateFormat('yyyy/MM/dd – HH:mm').format(selectedDateTime!)
            : DateFormat('yyyy/MM/dd – HH:mm').format(DateTime.now());

    return InkWell(
      onTap: () => _pickDateTime(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: customBoxDecoration(context),
        child: Row(
          children: [
            const Icon(Icons.calendar_today),
            const SizedBox(width: 8),
            Expanded(
              child: Text(displayText, style: theme.textTheme.bodyMedium),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
