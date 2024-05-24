import 'package:flutter/material.dart';
import 'package:myapp/screens/Overview/components/build_table.dart';

class OverviewValuesPage extends StatelessWidget {
  final int month;
  final int year;
  final List<List<Map<String, dynamic>>> data;

  const OverviewValuesPage({
    Key? key, 
    required this.month,
    required this.year,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    List<Map<String,dynamic>> dataIngresos = data[0];
    List<Map<String,dynamic>> dataGastos = data[1];
    List<Map<String,dynamic>> dataAhorros = data[2];
    
    return Container(
      child: Column(
        children: [
          _buildProgressCardNumbers("Ingresos", dataIngresos),
          const SizedBox(height: 16),
          _buildProgressCardNumbers("Gastos", dataGastos),
          const SizedBox(height: 16),
          _buildProgressCardNumbers("Ahorros", dataAhorros),
          const SizedBox(height: 16),
        ]
      )
    );
  }

  Widget _buildProgressCardNumbers(String type, List<Map<String, dynamic>> data) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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