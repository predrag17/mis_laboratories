import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import '../models/event.dart';
import '../providers/event_provider.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return Scaffold(
      appBar: AppBar(title: const Text('Распоред на испити')),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2030),
            eventLoader: (day) => events
                .where((event) =>
                    event.date.day == day.day && event.date.month == day.month)
                .toList(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/map');
            },
            child: const Text('Прикажи локации'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEventDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddEventDialog(BuildContext context) {
    final titleController = TextEditingController();
    final locationController = TextEditingController();
    final latitudeController = TextEditingController();
    final longitudeController = TextEditingController();
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Додади нов настан'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Наслов'),
                ),
                TextField(
                  controller: locationController,
                  decoration: const InputDecoration(labelText: 'Локација'),
                ),
                TextField(
                  controller: latitudeController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      const InputDecoration(labelText: 'Ширина (Latitude)'),
                ),
                TextField(
                  controller: longitudeController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      const InputDecoration(labelText: 'Должина (Longitude)'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate != null) {
                      selectedDate = pickedDate;
                    }
                  },
                  child: Text(selectedDate == null
                      ? 'Избери датум'
                      : 'Датум: ${selectedDate!.toLocal()}'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Откажи'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    locationController.text.isNotEmpty &&
                    selectedDate != null &&
                    latitudeController.text.isNotEmpty &&
                    longitudeController.text.isNotEmpty) {
                  final event = Event(
                    title: titleController.text,
                    date: selectedDate!,
                    location: locationController.text,
                    latitude: double.parse(latitudeController.text),
                    longitude: double.parse(longitudeController.text),
                  );
                  Provider.of<EventProvider>(context, listen: false)
                      .addEvent(event);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Пополнете ги сите полиња!')),
                  );
                }
              },
              child: const Text('Додади'),
            ),
          ],
        );
      },
    );
  }
}
