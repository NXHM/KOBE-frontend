import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/month_controller.dart';
import 'package:myapp/entities/Month.dart';

class PeriodSelector extends StatefulWidget {
  final bool? showPercentages;
  final int day;
  final ValueNotifier<int> monthNotifier;
  final ValueNotifier<int> yearNotifier;

  const PeriodSelector({
    Key? key,
    required this.showPercentages,
    required this.day,
    required this.monthNotifier,
    required this.yearNotifier
  }) : super(key: key);

  @override
  _PeriodSelectorState createState() => _PeriodSelectorState();
}

class _PeriodSelectorState extends State<PeriodSelector> {
  final MonthController _controller = Get.put(MonthController());

  @override
  Widget build(BuildContext context) {
    TextStyle encabezado = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    return Obx((){
      if (_controller.months.isEmpty) {
        return Center(child: CircularProgressIndicator(),);
      }
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
              _buildCalendarButtons(widget.yearNotifier , widget.monthNotifier, _controller),
              SizedBox(height: 8,),
              Text("Progreso del Periodo", style: encabezado,),
              SizedBox(height: 8,),
              _buildProgressBox(widget.yearNotifier.value, widget.monthNotifier.value, widget.day),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildCalendarButtons(ValueNotifier yearNotifier, ValueNotifier monthNotifier, MonthController controller) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<int>(
            value: widget.yearNotifier.value,
            onChanged: (int? value) {widget.yearNotifier.value = value!;},
            dropdownColor: Colors.white,
            isExpanded: true,
            items: controller.years.map((year) {
              return DropdownMenuItem<int>(
                value: year,
                child: Text(
                  year.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: DropdownButtonFormField<int>(
            value: widget.monthNotifier.value,
            onChanged: (int? value) {widget.monthNotifier.value = value!;},
            dropdownColor: Colors.white,
            items: controller.months.map((Month month) {
              return DropdownMenuItem<int>(
                value: month.id,
                child: Text(
                  month.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                )
              );
            }).toList(),
          ),
        ),
      ],
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