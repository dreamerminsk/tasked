import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import 'home_controller.dart';

class HomeChart extends StatelessWidget {
  final RxDouble fontSize = RxDouble(11.0);
  final isChart = true.obs;

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final HomeController c = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width * 0.96,
          height: Get.height * 0.96,
          margin: EdgeInsets.all(12.0),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
            border: Border.all(
              color: colorScheme.primary,
              width: 2.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: isChart.value ? _LineChart() : Text('LineChart'),
                ), // Padding
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ObxValue((data) => 
                  Text( 
                   '${fontSize.value}',style: textTheme.headlineSmall!,
                  ),fontSize
                  ),
                ), // Padding
              ),
              GestureDetector(
                onTap: () {
                    fontSize.value = fontSize.value + 1.0;
                },
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Obx(() => Text(
                              c.summary.value?.extract ?? '~~~~~',
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.fade,
                              style: textTheme.bodyLarge!,
                            ),
                        ),
                  ), // Padding
                ), // Expanded
              ), // GestureDetector
            ],
          ), // Column
        ), // Container
      ), // SafeArea
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData0,
      duration: const Duration(milliseconds: 4000),
    );
  }

  LineChartData get sampleData0 => LineChartData(
        lineTouchData: lineTouchData0,
        gridData: gridData,
        titlesData: titlesData0,
        borderData: borderData,
        lineBarsData: lineBarsData0,
        minX: 0,
        maxX: 14,
        maxY: 400000,
        minY: 0,
      );

  LineTouchData get lineTouchData0 => const LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData0 => FlTitlesData(
        bottomTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  List<LineChartBarData> get lineBarsData0 => [
        lineChartBarData0_1,
      ];

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData0_1 => LineChartBarData(
        isCurved: true,
        color: Colors.red,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 164361),
          FlSpot(2, 71020),
          FlSpot(3, 51699),
          FlSpot(4, 257168),
          FlSpot(5, 156045),
          FlSpot(6, 59728),
          FlSpot(7, 41071),
          FlSpot(8, 39796),
          FlSpot(9, 80910),
          FlSpot(10, 71686),
          FlSpot(11, 192024),
          FlSpot(12, 385736),
        ],
      );
}
