import 'package:flutter/material.dart';

class OverviewPercentagesPage extends StatelessWidget {
  final List<List<Map<String, dynamic>>> data;

  const OverviewPercentagesPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
        children: [
          _buildProgressCard("Ingresos", Colors.green, data[0]),
          const SizedBox(height: 16),
          _buildProgressCard("Gastos", Colors.pink, data[1]),
          const SizedBox(height: 16),
          _buildProgressCard("Ahorros", Colors.blueAccent, data[2]),
          const SizedBox(height: 16),
      ]
    );
  }

  Widget _buildProgressCard(String type, Color color, List<Map<String, dynamic>> data) {
    double progress = calculateProgress(data);
    String stringProgress = (progress*100).toStringAsFixed(1);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(type, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 8),
            Stack(
              children: [
                Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12), 
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 24,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: progress >= 0.98 ? BorderRadius.circular(12) : BorderRadius.only(
                        topLeft: Radius.circular(12), 
                        bottomLeft: Radius.circular(12)
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text("$stringProgress%", style: TextStyle(color: /* progress >= 0.50 ? Colors.white :  */Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  double calculateProgress(List<Map<String,dynamic>> data) {
    double total = 0;
    double progress = 0;

    for(int i = 0; i < data.length; i++){
      Map<String, dynamic>item = data[i];
      progress += int.parse(item["col2"]);
      total += int.parse(item["col3"]);
    }

    double x = progress/total;

    return x >= 1 ? 1 : x;
  }
}