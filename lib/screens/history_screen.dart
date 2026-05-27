import 'package:flutter/material.dart';
import '../state/app_state.dart';
import '../models/mood_record.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  void deleteRecord(int index) {
    setState(() => journal.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentBgColor,
      appBar: AppBar(
        title: const Text('Мои записи'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: journal.isEmpty
          ? const Center(child: Text('Пока нет записей 📝'))
          : ListView.builder(
              itemCount: journal.length,
              itemBuilder: (context, index) {
                MoodRecord rec = journal[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Text(rec.emoji, style: const TextStyle(fontSize: 28)),
                    title: Text(rec.text),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Color.fromARGB(255, 247, 201, 198)),
                      onPressed: () => deleteRecord(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}