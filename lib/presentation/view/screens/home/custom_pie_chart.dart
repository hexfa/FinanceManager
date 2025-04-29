import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomPieChart extends StatelessWidget {
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
                    (d) => PieChartSectionData(
                      color: d.color,
                      value: d.percentage,
                      title: '${d.title}\n${d.percentage}%',
                      titleStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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

class PieData {
  final String title;
  final double percentage;
  final Color color;

  PieData({required this.title, required this.percentage, required this.color});
}