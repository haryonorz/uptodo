import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/models/running_focus.dart';
import 'package:uptodo/shared/common/app_colors.dart';
import 'package:uptodo/shared/common/common.dart';

class ChartAppOverview extends StatelessWidget {
  const ChartAppOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.7,
      child: _BarChart(),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: List.generate(
          listRunningFocus.length,
          (index) => BarChartGroupData(
            x: listRunningFocus[index].day,
            barRods: [
              BarChartRodData(
                toY: listRunningFocus[index].timeInMinutes,
                width: 28.w,
                color: index == 5 ? AppColors.vistaBlue : AppColors.quickSilver,
                borderRadius: BorderRadius.circular(4),
              )
            ],
            showingTooltipIndicators: [0],
          ),
        ),
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        minY: -10,
        maxY: 420,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 5,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            var hours = (rod.toY / 60).round();
            var minutes = (rod.toY % 60).round();
            return BarTooltipItem(
              minutes != 0 ? '${hours}h ${minutes}m' : '${hours}h',
              const TextStyle(
                fontSize: 12,
              ),
            );
          },
        ),
      );

  Widget getLeftTitles(double value, TitleMeta meta) {
    var style = const TextStyle(
      fontSize: 12,
    );
    var hours = (value / 60).round();
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(hours == 0 || hours == 7 ? '' : '${hours}h', style: style),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    var style = const TextStyle(
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'SUN';
        style = const TextStyle(
          color: AppColors.tartOrange,
          fontSize: 12,
        );
        break;
      case 1:
        text = 'MON';
        break;
      case 2:
        text = 'TUE';
        break;
      case 3:
        text = 'WED';
        break;
      case 4:
        text = 'THU';
        break;
      case 5:
        text = 'FRI';
        break;
      case 6:
        text = 'SAT';
        style = const TextStyle(
          color: AppColors.tartOrange,
          fontSize: 12,
        );
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 60,
            reservedSize: 30,
            getTitlesWidget: getLeftTitles,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getBottomTitles,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          left: BorderSide(
            width: 2,
            color: AppColors.white87,
          ),
          bottom: BorderSide(
            width: 2,
            color: AppColors.white87,
          ),
        ),
      );
}
