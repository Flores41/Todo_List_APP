import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/provider/tarea_provider.dart';

class Fecha extends StatelessWidget {
  const Fecha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fechaProvider = context.watch<TaskProvider>();
    final colorScheme = Theme.of(context).colorScheme;
    final sizeWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fecha'.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                _selectDate(context, fechaProvider);
              },
              child: Container(
                width: sizeWidth * 0.45,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorScheme.primary.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Text(
                      '${fechaProvider.seleccionarFecha!.day}/${fechaProvider.seleccionarFecha!.month}/${fechaProvider.seleccionarFecha!.year}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 25,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () {
                _selectTime(context, fechaProvider);
              },
              child: Container(
                width: sizeWidth * 0.35,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorScheme.primary.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Text(
                      '${fechaProvider.seleccionarFecha!.hour}:${fechaProvider.seleccionarFecha!.minute}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.access_time_rounded,
                      size: 25,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, TaskProvider provider) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: provider.seleccionarFecha!,
      firstDate: DateTime(2024),
      lastDate: DateTime(2101),
    );

    /// Si la fecha no es nula, actualice la fecha.
    if (pickedDate != provider.seleccionarFecha) {
      provider.updateDate(pickedDate!);
    }
  }

  Future<void> _selectTime(BuildContext context, TaskProvider provider) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(provider.seleccionarFecha!),
    );
    if (pickedTime != null) {
      final DateTime currentTime = provider.seleccionarFecha!;
      final DateTime updatedTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      provider.updateTime(updatedTime);
    }
  }
}
