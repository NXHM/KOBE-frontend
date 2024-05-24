import 'package:flutter/material.dart';

class PeriodSelector extends StatefulWidget {
  final bool? showPercentages;
  final int day;
  final int month;
  final int year;
  final Function(int) changeMonth;
  final Function(int) changeYear;
  /* final VoidCallback changeMonth;
  final VoidCallback changeYear; */

  const PeriodSelector({
    Key? key,
    required this.showPercentages,
    required this.day,
    required this.month,
    required this.year,
    required this.changeMonth,
    required this.changeYear,
  }) : super(key: key);

  @override
  _PeriodSelectorState createState() => _PeriodSelectorState();
}

class _PeriodSelectorState extends State<PeriodSelector> {
  final Map<int, String> months ={ 
    1: "Enero", 2: "Febrero", 3: "Marzo", 4: "Abril", 5: "Mayo", 6: "Junio", 7: "Julio",
    8: "Agosto", 9: "Septiembre", 10: "Octubre", 11: "Noviembre", 12: "Diciembre",
  };

  @override
  Widget build(BuildContext context) {
    TextStyle encabezado = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Periodo Seleccionado", style: encabezado,),
            SizedBox(height: 8,),
            _buildCalendarButtons(),
            SizedBox(height: 8,),
            Text("Progreso del Periodo", style: encabezado,),
            SizedBox(height: 8,),
            _buildProgressBox(widget.year, widget.month, widget.day),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarButtons() {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<int>(
            value: widget.year,
            onChanged: (int? value) {widget.changeYear(value!);},
            dropdownColor: Colors.white,
            items: <int>[
              2022,
              2023,
              2024,
              2025,
              2026,
              2027,
              // Agrega más años según sea necesario
            ].map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString(),),
              );
            }).toList(),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: DropdownButtonFormField<int>(
            value: widget.month,
            onChanged: (int? value) {widget.changeMonth(value!);},
            dropdownColor: Colors.white,
            items: months.keys.map((int key) {
              return DropdownMenuItem<int>(
                value: key,
                child: Text(months[key]!,),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodButton(String text) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(text, style: TextStyle(
            fontSize: 16,
          ),),
        ),
      ) 
    );
  }

  Widget _buildProgressBox(int year, int month, int day) {
    int daysInMonth = getDaysInMonth(year, month);
    double progress = getProgressByMonth(day, daysInMonth);
    String stringProgress = (progress*100).toStringAsFixed(1);

    return Stack(
      children: [
        LinearProgressIndicator(
          value: progress,
          color: Color.fromARGB(255, 0, 20, 60),
          backgroundColor: Colors.grey[300],
          minHeight: 30,
          borderRadius: BorderRadius.circular(8),
        ),
        Center(
          heightFactor: 1.5,
          child: Text(
            widget.showPercentages == true ? "$stringProgress%" : "$day/$daysInMonth", 
            style: TextStyle(
              color: progress >= 0.45 ? Colors.white : Colors.black, 
              fontWeight: FontWeight.bold), 
              textAlign: TextAlign.center,)
        )
      ],
    );
  }

  int getDaysInMonth(int year, int month) {
    if(month == DateTime.february){
      final bool isLeapYear = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
      return isLeapYear ? 29: 28;
    }
    const List<int> daysPerMonth = [31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysPerMonth[month-1];
  }

  double getProgressByMonth(int day, int dayMonth) {
    return day/dayMonth;
  }
}