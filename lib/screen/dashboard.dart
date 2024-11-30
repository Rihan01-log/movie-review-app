import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Map<String, double> data = {'Book Review': 50, 'Movie Review': 50};

  final List<Color> colorList = [Colors.red, Colors.green];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Dashboard',
            style: GoogleFonts.alatsi(color: Colors.white, fontSize: 24)),
        centerTitle: true,
      ),
      body: Container(
        child: PieChart(
          key: const Key('pie_chart'),
          dataMap: data,
          colorList: colorList,
          chartRadius: MediaQuery.of(context).size.width / 7.2,
          legendOptions: const LegendOptions(
              showLegendsInRow: false,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(fontWeight: FontWeight.bold)),
          chartValuesOptions: const ChartValuesOptions(
              showChartValuesInPercentage: true,
              showChartValuesOutside: true,
              decimalPlaces: 1),
        ),
      ),
    );
  }
}
