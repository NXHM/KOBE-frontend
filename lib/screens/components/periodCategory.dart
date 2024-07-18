import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/month_controller.dart';
import 'package:myapp/entities/Month.dart';

class PeriodCategory extends StatefulWidget {
  final ValueNotifier<int> monthNotifier;
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
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Periodo de Inicio',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120, // Ajusta el ancho del contenedor
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<int>(
                      value: widget.yearNotifier.value,
                      underline: SizedBox(),
                      isExpanded:
                          true, // Permite que el DropdownButton use todo el ancho disponible
                      items: _controller.years.map((year) {
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
                      onChanged: (int? newYear) {
                        setState(() {
                          widget.yearNotifier.value = newYear!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 150, // Ajusta el ancho del contenedor
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<int>(
                      value: widget.monthNotifier.value,
                      underline: SizedBox(),
                      isExpanded:
                          true, // Permite que el DropdownButton use todo el ancho disponible
                      items: _controller.months.map((Month month) {
                        return DropdownMenuItem<int>(
                          value: month.id,
                          child: Text(
                            month.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (int? newMonth) {
                        setState(() {
                          widget.monthNotifier.value = newMonth!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
