// lib/views/dashboard_content_view.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class DashboardContentView extends StatelessWidget {
  const DashboardContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildDateFilter(),
            ],
          ),
          const SizedBox(height: 20),
          _buildStatCards(),
          const SizedBox(height: 30),
          _buildUserCountChart(),
          const SizedBox(height: 30),
          _buildOrderDistributionChart(),
        ],
      ),
    );
  }

  Widget _buildDateFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Row(
        children: [
          Text(
            'Last 7 Days',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget _buildStatCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('Total Farmers', '198', '-5', Colors.blue, Icons.person_rounded),
        _buildStatCard('Total Crops', '5', '-5', Colors.green, Icons.grass),
        _buildStatCard('Total Revenue', '₹5,495.00', '-₹820', Colors.yellow, Icons.monetization_on),
        _buildStatCard('Open Tickets', '12', '+0', Colors.red, Icons.report_problem),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String change, Color iconColor, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: iconColor),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                change,
                style: TextStyle(
                  color: change.startsWith('+') ? Colors.green : Colors.red,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserCountChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Count',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  barGroups: _getBarGroups(),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.grey, width: 1),
                      left: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: _getLeftTitles,
                        reservedSize: 30,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: _getBottomTitles,
                        reservedSize: 30,
                      ),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    final List<int> userCounts = [3, 1, 1, 0, 0, 5, 0];
    return List.generate(userCounts.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: userCounts[index].toDouble(),
            color: Colors.blue,
            width: 30,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
        ],
      );
    });
  }

  static Widget _getLeftTitles(double value, TitleMeta meta) {
    if (value.toInt() == 0 || value.toInt() % 1 != 0) return const Text('');
    return Text(value.toInt().toString(), style: const TextStyle(color: Colors.grey, fontSize: 12));
  }

  static Widget _getBottomTitles(double value, TitleMeta meta) {
    const days = ['27 Aug', '28 Aug', '29 Aug', '30 Aug', '31 Aug', '1 Sep', '2 Sep'];
    final index = value.toInt();
    if (index >= 0 && index < days.length) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 8.0,
        child: Text(days[index], style: const TextStyle(color: Colors.grey, fontSize: 10)),
      );
    }
    return const SizedBox();
  }

  Widget _buildOrderDistributionChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Distribution',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: _getPieSections(),
                        sectionsSpace: 0,
                        centerSpaceRadius: 70,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                _buildOrderLegend(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _getPieSections() {
    return [
      PieChartSectionData(
        color: Colors.red,
        value: 27.3,
        title: '27.3%',
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: Colors.yellow,
        value: 18.2,
        title: '18.2%',
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: Colors.blue,
        value: 54.5,
        title: '54.5%',
        showTitle: false,
        radius: 20,
      ),
    ];
  }

  Widget _buildOrderLegend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLegendItem(color: Colors.red, text: 'GEMS', percentage: '27.3%'),
        _buildLegendItem(color: Colors.yellow, text: 'LIVES', percentage: '18.2%'),
        _buildLegendItem(color: Colors.blue, text: 'COINS', percentage: '54.5%'),
      ],
    );
  }

  Widget _buildLegendItem({required Color color, required String text, required String percentage}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 60,
            child: Text(text, style: const TextStyle(color: Colors.black54)),
          ),
          Text(percentage, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}