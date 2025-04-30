import 'package:finance_manager/data/models/PieData.dart';
import 'package:finance_manager/presentation/base/base_stateless_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomPieChart extends BaseStatelessWidget {
  final List<PieData> data = [
    PieData(title: 'کار', percentage: 5, color: Colors.blue),
    PieData(title: 'تفریح', percentage: 7, color: Colors.green),
    PieData(title: 'ورزش', percentage: 20, color: Colors.orange),
    PieData(title: 'دیگر', percentage: 17, color: Colors.grey),
    PieData(title: 'مطالعه', percentage: 30, color: Colors.purple),
    PieData(title: 'خواب', percentage: 21, color: Colors.red),
  ];

  CustomPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          sections:
              data
                  .map(
                    (data) => PieChartSectionData(
                      color: data.color,
                      value: data.percentage,
                      title: '${data.title}\n${data.percentage}%',
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
