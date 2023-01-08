import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/chart_data_model.dart';

class BarItem extends StatefulWidget {
  final List<ChartDataModel> chartDataModel;
  final String chartname;

  const BarItem({
    Key? key,
    required this.chartDataModel,
    required this.chartname,
  }) : super(key: key);

  @override
  State<BarItem> createState() => _BarItemState();
}

class _BarItemState extends State<BarItem> {

  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final oneUnitHeight = deviceHeight/781.091;

    return SizedBox(
      height: oneUnitHeight * 300,
      child: SfCartesianChart(
        title: ChartTitle(
          text: widget.chartname,
          textStyle: TextStyle(
            fontSize: oneUnitHeight * 14,
            color: Colors.black54,
          ),
        ),
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 3000, interval: 500),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<ChartDataModel, String>>[
            ColumnSeries<ChartDataModel, String>(
                animationDuration: 2000,
                dataSource: widget.chartDataModel,
                xValueMapper: (ChartDataModel data, _) => (data.x).toString(),
                yValueMapper: (ChartDataModel data, _) => data.y,
                pointColorMapper: (ChartDataModel data, _) => data.clr,
                name: "People"
                ),
          ]));
  }
}
