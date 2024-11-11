import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'homepage.dart';

class DashboardScreen extends StatelessWidget {
  final months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: [
          Row(
            children: [
              TextButton.icon(
                onPressed: () async {
                  // Show date picker when the calendar icon is pressed
                  DateTimeRange? dateRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (dateRange != null) {
                    // Update the chart based on the selected date range if needed
                    print("Selected Date Range: ${dateRange.start} to ${dateRange.end}");
                  }
                },
                icon: Icon(Icons.calendar_today, color: Colors.black),
                label: Text(
                  '2023 (1 Jan - today)',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              IconButton(
                icon: Icon(Icons.bar_chart, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.filter_alt, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First card with Number of Cases chart
            _buildStatsCard(
              title: '50,93,232',
              subtitle: 'Number Of Cases',
              icon: Icons.trending_up,
              iconColor: Colors.green,
              trendText: '3,99,626',
              trendColor: Colors.green,
              chart: _buildCasesBarChart(),
            ),
            SizedBox(height: 16),
            // Comparison and Cases Increase row
            Row(
              children: [
                Expanded(
                  child: _buildStatsCard(
                    title: 'Comparison\n2022 | 2023',
                    subtitle: '',
                    chart: _buildComparisonBarChart(),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildStatsCard(
                    title: '23\'261',
                    subtitle: 'Cases Increase',
                    chart: _buildLineChart(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Bottom row with "Know your rights" and "State wise stats" cards
            Row(
              children: [
                Expanded(
                  child: _buildIconCard(
                    icon: Icons.gavel,
                    title: 'Know your rights',
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildIconCard(
                    icon: Icons.pie_chart,
                    title: 'State wise stats',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard({
    required String title,
    required String subtitle,
    IconData? icon,
    Color? iconColor,
    String? trendText,
    Color? trendColor,
    Widget? chart,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              if (trendText != null && trendColor != null)
                Row(
                  children: [
                    Icon(icon, color: iconColor ?? Colors.black, size: 16),
                    SizedBox(width: 4),
                    Text(
                      trendText,
                      style: TextStyle(color: trendColor, fontSize: 14),
                    ),
                  ],
                ),
            ],
          ),
          SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 8),
          if (chart != null) chart,
        ],
      ),
    );
  }

  Widget _buildIconCard({required IconData icon, required String title}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Icon(icon, size: 48, color: Colors.grey),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildCasesBarChart() {
    return SizedBox(
      height: 150,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              showTitles: true,
              interval: 2, // Show every other month
              getTitles: (value) {
                final monthIndex = value.toInt();
                if (monthIndex >= 0 && monthIndex < months.length) {
                  return months[monthIndex];
                }
                return '';
              },
              rotateAngle: 45, // Rotate the labels to avoid overlap
            ),
            leftTitles: SideTitles(showTitles: true),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            for (var i = 0; i < 12; i++)
              BarChartGroupData(
                x: i,
                barRods: [BarChartRodData(y: (i + 1) * 0.5 + 4, colors: [Colors.green])],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonBarChart() {
    return SizedBox(
      height: 150,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              showTitles: true,
              interval: 2, // Show every other month
              getTitles: (value) {
                final monthIndex = value.toInt();
                if (monthIndex >= 0 && monthIndex < months.length) {
                  return months[monthIndex];
                }
                return '';
              },
              rotateAngle: 45, // Rotate the labels to avoid overlap
            ),
            leftTitles: SideTitles(showTitles: true),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            for (var i = 0; i < 6; i++)
              BarChartGroupData(x: i, barRods: [
                BarChartRodData(y: (i + 1) * 0.5 + 3, colors: [Colors.blue]),
                BarChartRodData(y: (i + 1) * 0.4 + 3.5, colors: [Colors.orange]),
              ]),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    return SizedBox(
      height: 150,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              showTitles: true,
              interval: 2, // Show every other month
              getTitles: (value) {
                final monthIndex = value.toInt();
                if (monthIndex >= 0 && monthIndex < months.length) {
                  return months[monthIndex];
                }
                return '';
              },
              rotateAngle: 45, // Rotate the labels to avoid overlap
            ),
            leftTitles: SideTitles(showTitles: true),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 2),
                FlSpot(1, 3),
                FlSpot(2, 2.5),
                FlSpot(3, 3.5),
                FlSpot(4, 3),
                FlSpot(5, 4),
              ],
              isCurved: true,
              colors: [Colors.orange],
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
