import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/data/models/transaction_chart_data.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomPieChart extends BaseStatelessWidget {
  final List<TransactionChartData> data;
  const CustomPieChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections:
          data.map((data) => PieChartSectionData(
                      color: data.color,
                      value: ConvertString.roundToTwoDecimals(data.percentage),
                      title:
                          '${data.title}\n${ConvertString.formatCurrencyFromDouble(data.percentage)}%',
                      titleStyle: theme(context).textTheme.labelSmall?.copyWith(
                        color: theme(context).colorScheme.surface,
                      ),
                    ),
                  )
              .toList(),

          sectionsSpace: 2,

          centerSpaceRadius: 40,

        ),

      ),

    );

  }

}
