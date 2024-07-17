import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/month_controller.dart';
import 'package:myapp/entities/Month.dart';

class PeriodCategory extends StatefulWidget {
  final ValueNotifier<int> monthNotifier; // Añadir ValueNotifier

  PeriodCategory({required this.monthNotifier});

  @override
  State<PeriodCategory> createState() => _PeriodCategoryState();
}

class _PeriodCategoryState extends State<PeriodCategory> {
  final MonthController _controller = Get.put(MonthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.months.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<int>(
            value:
                2024, // Puedes cambiar esto a un valor dinámico si es necesario
            items: [2024, 2025, 2026].map((year) {
              return DropdownMenuItem<int>(
                value: year,
                child: Text(year.toString()),
              );
            }).toList(),
            onChanged: (int? newYear) {
              // Lógica para cambiar el año
            },
          ),
          SizedBox(width: 16),
          DropdownButton<int>(
            value: _controller.id_selected.value,
            items: _controller.months.map((Month month) {
              return DropdownMenuItem<int>(
                value: month.id,
                child: Text(month.name),
              );
            }).toList(),
            onChanged: (int? newMonth) {
              setState(() {
                _controller.id_selected.value = newMonth!;
                print(_controller.id_selected.value);
                widget.monthNotifier.value =
                    newMonth; // Notificar el cambio de month_id
              });
            },
          ),
        ],
      );
    });
  }
}
