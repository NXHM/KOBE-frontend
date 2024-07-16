import 'package:flutter/material.dart';
import 'package:myapp/screens/Overview/components/build_table.dart';

class OverviewValuesPage extends StatelessWidget {
  final List<List<Map<String, dynamic>>> data;

  const OverviewValuesPage({
    Key? key, 
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){    
    return Container(
      child: Column(
        children: [
          data[0].isEmpty ? 
          const SizedBox(height: 0)
          :
          Column(children: [
            _buildProgressCardNumbers("Ingresos", data[0]),
          const SizedBox(height: 16),
          ],),
          data[1].isEmpty ? 
          const SizedBox(height: 0)
          :
          Column(children: [
            _buildProgressCardNumbers("Gastos", data[1]),
          const SizedBox(height: 16),
          ],),
          data[2].isEmpty ? 
          const SizedBox(height: 0)
          :
          Column(children: [
            _buildProgressCardNumbers("Ahorros", data[2]),
          const SizedBox(height: 16),
          ],)
        ]
      )
    );
  }

  Widget _buildProgressCardNumbers(String type, List<Map<String, dynamic>> data) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  type,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              buildTable(data: data),
            ],
          ),
        )
    );
  }
}