import 'package:travel_app_bloc_and_cubit/models/chart_data_model.dart';

class ChartModel{
  final String chartname;
  final List<ChartDataModel> chartDataModelList;

  ChartModel({
    required this.chartname,
    required this.chartDataModelList,
  });
}