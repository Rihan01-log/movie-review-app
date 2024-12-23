import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:review_app/function/functions.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Color> colorList = [Colors.red, Colors.green];

  final movie = 'Movie';
  final book = 'Book';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Dashboard',
            style: GoogleFonts.alatsi(color: Colors.white, fontSize: 24)),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: reviewNotifier,
        builder: (context, value, child) {
          final mb = value.where((catg) => catg.bookormoviel == movie);
          final bk = value.where((catg) => catg.bookormoviel == book);
          final Map<String, double> data = {
            'Book Review': bk.length.toDouble(),
            'Movie Review': mb.length.toDouble()
          };
          return PieChart(
            key: const Key('pie_chart'),
            dataMap: data,
            colorList: colorList,
            chartRadius: MediaQuery.of(context).size.width / 2.5,
            legendOptions: const LegendOptions(
                showLegendsInRow: false,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(fontWeight: FontWeight.bold)),
            chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                decimalPlaces: 1),
          );
        },
      ),
    );
  }
}
