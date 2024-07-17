import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/month_controller.dart';
import 'package:myapp/entities/Month.dart';

class PeriodCategory extends StatefulWidget {
  final ValueNotifier<int> monthNotifier; // Añadir ValueNotifier
  final ValueNotifier<int> yearNotifier;
  PeriodCategory({required this.monthNotifier, required this.yearNotifier});

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
            value: _controller.year_selected
                .value, // Puedes cambiar esto a un valor dinámico si es necesario
            items: _controller.years.map((year) {
              return DropdownMenuItem<int>(
                value: year,
                child: Text(year.toString()),
              );
            }).toList(),
            onChanged: (int? newYear) {
              setState(() {
                _controller.year_selected.value = newYear!;
                print(_controller.year_selected.value);
                widget.yearNotifier.value =
                    newYear; // Notificar el cambio de month_id
              });
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
