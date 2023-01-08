import "package:flutter/material.dart";
import 'package:travel_app_bloc_and_cubit/models/chart_data_model.dart';
import 'package:travel_app_bloc_and_cubit/models/chart_model.dart';
import 'package:travel_app_bloc_and_cubit/screens/nav_screens/bar_item.dart';

class BarItemScreen extends StatelessWidget {
  const BarItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChartModel> _chartModel = [
      ChartModel(
        chartname: "Number of people visited at Canada, British Columbia",
        chartDataModelList: [
          ChartDataModel(x: 2017, y: 1550, clr: Colors.redAccent),
          ChartDataModel(x: 2018, y: 1350, clr: Colors.purpleAccent),
          ChartDataModel(x: 2019, y: 1000, clr: Colors.yellowAccent),
          ChartDataModel(x: 2020, y: 50, clr: Colors.lightBlueAccent),
          ChartDataModel(x: 2021, y: 70, clr: Colors.orangeAccent),
          ChartDataModel(x: 2022, y: 500, clr: Colors.greenAccent),
        ],
      ),
      ChartModel(
        chartname: "Number of people visited at Icefields, Alberta",
        chartDataModelList: [
          ChartDataModel(x: 2017, y: 1400, clr: Colors.redAccent),
          ChartDataModel(x: 2018, y: 2000, clr: Colors.purpleAccent),
          ChartDataModel(x: 2019, y: 700, clr: Colors.yellowAccent),
          ChartDataModel(x: 2020, y: 50, clr: Colors.lightBlueAccent),
          ChartDataModel(x: 2021, y: 20, clr: Colors.orangeAccent),
          ChartDataModel(x: 2022, y: 300, clr: Colors.greenAccent),
        ],
      ),
      ChartModel(
        chartname: "Number of people visited at Moraine Lake, Alberta",
        chartDataModelList: [
          ChartDataModel(x: 2017, y: 2000, clr: Colors.redAccent),
          ChartDataModel(x: 2018, y: 1700, clr: Colors.purpleAccent),
          ChartDataModel(x: 2019, y: 1000, clr: Colors.yellowAccent),
          ChartDataModel(x: 2020, y: 50, clr: Colors.lightBlueAccent),
          ChartDataModel(x: 2021, y: 20, clr: Colors.orangeAccent),
          ChartDataModel(x: 2022, y: 100, clr: Colors.greenAccent),
        ],
      ),
      ChartModel(
        chartname: "Number of people visited at Killarney Provincial Park",
        chartDataModelList: [
          ChartDataModel(x: 2017, y: 2300, clr: Colors.redAccent),
          ChartDataModel(x: 2018, y: 3000, clr: Colors.purpleAccent),
          ChartDataModel(x: 2019, y: 2200, clr: Colors.yellowAccent),
          ChartDataModel(x: 2020, y: 100, clr: Colors.lightBlueAccent),
          ChartDataModel(x: 2021, y: 150, clr: Colors.orangeAccent),
          ChartDataModel(x: 2022, y: 800, clr: Colors.greenAccent),
        ],
      ),
      ChartModel(
        chartname: "Number of people visited at Palestine, Gaza",
        chartDataModelList: [
          ChartDataModel(x: 2017, y: 1550, clr: Colors.redAccent),
          ChartDataModel(x: 2018, y: 2100, clr: Colors.purpleAccent),
          ChartDataModel(x: 2019, y: 300, clr: Colors.yellowAccent),
          ChartDataModel(x: 2020, y: 200, clr: Colors.lightBlueAccent),
          ChartDataModel(x: 2021, y: 80, clr: Colors.orangeAccent),
          ChartDataModel(x: 2022, y: 1000, clr: Colors.greenAccent),
        ],
      ),
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: _chartModel.length,
        itemBuilder: (ctx, idx){
          return Column(
            children: [
              BarItem(
                chartDataModel: _chartModel[idx].chartDataModelList,
                chartname: _chartModel[idx].chartname,
              ),
              const Divider(
                height: 2,
                color: Colors.grey,
              ),
            ],
          );
        },
      ),
    );
  }
}