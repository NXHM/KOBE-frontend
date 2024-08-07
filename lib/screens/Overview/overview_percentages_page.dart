import 'package:flutter/material.dart';
import 'package:myapp/screens/Overview/components/progress_card.dart';

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
          data[0].isEmpty ? 
          const SizedBox(height: 0)
          :
          Column(children: [
            ProgressCard(type: "Ingresos", color: Colors.green, data: data[0]),
            const SizedBox(height: 16),
          ],),
          data[1].isEmpty ? 
          const SizedBox(height: 0)
          :
          Column(children: [
            ProgressCard(type: "Gastos", color: Colors.pink, data: data[1]),
            const SizedBox(height: 16),
          ],),
          data[2].isEmpty ? 
          const SizedBox(height: 0)
          :
          Column(children: [
            ProgressCard(type: "Ahorros", color: Colors.blueAccent, data: data[2]),
            const SizedBox(height: 16),
          ],)
      ]
    );
  }
}