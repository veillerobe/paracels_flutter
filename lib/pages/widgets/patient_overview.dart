import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:paracels/themes/para_colors.dart';
import 'package:paracels/themes/para_sizes.dart';
import 'package:paracels/themes/para_text_styles.dart';
import 'package:paracels/widgets/para_card.dart';

class PatientOverview extends StatelessWidget {
  const PatientOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return ParaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: ParaSizes.spacing16,
        children: [
          Text(
            'Patient overview',
            style: ParaTextStyles.headline3,
          ),
          const LineChartSample4(),
        ],
      ),
    );
  }
}

TextStyle chartTextStyle = ParaTextStyles.body3Condensed.copyWith(
  color: ParaColors.secondary,
  fontWeight: FontWeight.w600,
);

class LineChartSample4 extends StatelessWidget {
  const LineChartSample4({
    super.key,
  });

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
      case 1:
        text = 'Feb';
      case 2:
        text = 'Mar';
      case 3:
        text = 'Apr';
      case 4:
        text = 'May';
      case 5:
        text = 'Jun';
      case 6:
        text = 'Jul';
      case 7:
        text = 'Aug';
      case 8:
        text = 'Sep';
      case 9:
        text = 'Oct';
      case 10:
        text = 'Nov';
      case 11:
        text = 'Dec';
      default:
        return Container();
    }

    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(
        text,
        style: chartTextStyle,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = chartTextStyle;
    return SideTitleWidget(
      meta: meta,
      child: Text(value.toStringAsFixed(0), style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    const patientNumber = [
      FlSpot(-0.5, 230),
      FlSpot(0, 270),
      FlSpot(1, 300),
      FlSpot(2, 280),
      FlSpot(3, 340),
      FlSpot(4, 320),
      FlSpot(5, 410),
      FlSpot(6, 360),
      FlSpot(7, 605),
      FlSpot(8, 380),
      FlSpot(9, 610),
      FlSpot(10, 400),
      FlSpot(11, 600),
      FlSpot(11.5, 1000),
    ];

    return AspectRatio(
      aspectRatio: 3,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 28,
          top: 22,
          bottom: 12,
        ),
        child: LineChart(
          LineChartData(
            lineTouchData: const LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                spots: patientNumber,
                isCurved: true,
                color: ParaColors.chart,
                belowBarData: BarAreaData(
                  show: true,
                  color: ParaColors.chart.withValues(alpha: 0.3),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ParaColors.chart.withValues(alpha: 0.3),
                      ParaColors.chart.withValues(alpha: 0.03),
                    ],
                  ),
                ),
                dotData: const FlDotData(
                  show: false,
                ),
              ),
            ],
            minX: -0.5,
            maxX: 11.5,
            minY: 0,
            maxY: 1300,
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(),
              rightTitles: const AxisTitles(),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  maxIncluded: false,
                  minIncluded: false,
                  reservedSize: 18,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                axisNameSize: 20,
                sideTitles: SideTitles(
                  showTitles: true,
                  maxIncluded: false,
                  interval: 200,
                  reservedSize: 40,
                  getTitlesWidget: leftTitleWidgets,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: false,
              border: Border(bottom: BorderSide(color: ParaColors.border)),
            ),
            gridData: const FlGridData(
              drawVerticalLine: false,
              horizontalInterval: 200,
            ),
          ),
        ),
      ),
    );
  }
}
