import 'package:flutter/material.dart';
import 'package:sol_ventus/Models/solarwinddatamodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Services/solar-wind-data-service.dart';
import 'package:collection/collection.dart';

import '../../constants/style_constants.dart';
import '../../shared_components/custom_appbar.dart';
import '../../shared_components/type_writer_animated_title.dart';

class SolarDataChartScreen extends StatefulWidget {
  const SolarDataChartScreen({Key? key}) : super(key: key);

  @override
  State<SolarDataChartScreen> createState() => _SolarDataChartScreenState();
}

class _SolarDataChartScreenState extends State<SolarDataChartScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: CustomAppBar().buildCustomAppBar(context),
        drawer: const Drawer(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/night.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder(
              future: getSolarWindData(),
              builder: (context, AsyncSnapshot<SolarWindDataModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                var avgSpeed = snapshot.data!.data
                    .map((e) => e.speed == null ? 0 : double.parse(e.speed!))
                    .average;

                var avgTemperature = snapshot.data!.data
                    .map((e) => e.temperature == null
                        ? 0
                        : double.parse(e.temperature!))
                    .average;

                var avgDensity = snapshot.data!.data
                    .map(
                        (e) => e.density == null ? 0 : double.parse(e.density!))
                    .average;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: Text(
                          "Speed(Km/s) Analysis",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: kDefaultTextColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              wordSpacing: 2,
                              fontFamily: 'SpecialElite'),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.3,
                        child: SfCartesianChart(
                            primaryYAxis: NumericAxis(
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            primaryXAxis: DateTimeAxis(
                                interval: 1,
                                labelStyle: TextStyle(color: Colors.white),
                                axisLine: AxisLine()),
                            series: <ChartSeries>[
                              // Renders fast line chart
                              FastLineSeries<SolarWindData, DateTime>(
                                  color: Colors.amber,
                                  dataLabelSettings: DataLabelSettings(
                                      color: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  xAxisName: "Time",
                                  yAxisName: "Speed (Solar Wind)",
                                  dataSource: snapshot.data!.data,
                                  xValueMapper: (SolarWindData data, _) =>
                                      data!.timeTag,
                                  yValueMapper: (SolarWindData data, _) =>
                                      double.parse(data!.speed ?? "$avgSpeed"))
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: Text(
                          "Temperature(K) Analysis",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: kDefaultTextColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              wordSpacing: 2,
                              fontFamily: 'SpecialElite'),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.3,
                        child: SfCartesianChart(
                            primaryYAxis: NumericAxis(
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            primaryXAxis: DateTimeAxis(
                              interval: 1,
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            series: <ChartSeries>[
                              // Renders fast line chart
                              FastLineSeries<SolarWindData, DateTime>(
                                  color: Colors.amber,
                                  xAxisName: "Time",
                                  yAxisName: "Speed (Solar Wind)",
                                  dataSource: snapshot.data!.data,
                                  xValueMapper: (SolarWindData data, _) =>
                                      data!.timeTag,
                                  yValueMapper: (SolarWindData data, _) =>
                                      double.parse(data!.temperature ??
                                          "$avgTemperature"))
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: Text(
                          "Density Analysis",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: kDefaultTextColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              wordSpacing: 2,
                              fontFamily: 'SpecialElite'),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.3,
                        child: SfCartesianChart(
                            primaryYAxis: NumericAxis(
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            primaryXAxis: DateTimeAxis(
                              interval: 1,
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            series: <ChartSeries>[
                              // Renders fast line chart
                              FastLineSeries<SolarWindData, DateTime>(
                                  color: Colors.amber,
                                  dataSource: snapshot.data!.data,
                                  xValueMapper: (SolarWindData data, _) =>
                                      data!.timeTag,
                                  yValueMapper: (SolarWindData data, _) =>
                                      double.parse(
                                          data!.density ?? "$avgDensity"))
                            ]),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
