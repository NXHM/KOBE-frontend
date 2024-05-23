import 'package:flutter/material.dart';

class PeriodSelector extends StatefulWidget {
  final int day;
  final int month;
  final int year;

  const PeriodSelector({
    Key? key,
    required this.day,
    required this.month,
    required this.year,
  }) : super(key: key);

  @override
  _PeriodSelectorState createState() => _PeriodSelectorState();
}

class _PeriodSelectorState extends State<PeriodSelector> {
  final List months = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Periodo Seleccionado", style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
            Row(
              children: [
                _buildPeriodButton("${widget.year}"),
                SizedBox(width: 8),
                _buildPeriodButton("${months[widget.month - 1]}"),
              ],
            )
          ],
        )
      ],
    );
  }

  //TODO: Hacer que los botones tengan el mismo tamaño y esten centrados

  Widget _buildPeriodButton(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(
        fontSize: 16,
      ),),
    );
  }
}