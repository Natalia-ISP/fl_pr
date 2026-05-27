import 'package:flutter/material.dart';
import '../models/mood_record.dart';
import '../state/app_state.dart';
import 'history_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String chosenEmoji = '😐';
  final TextEditingController textController = TextEditingController();

  void saveRecord() {
    String text = textController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пожалуйста, введи текст!')));
      return;
    }

    journal.add(MoodRecord(chosenEmoji, text));
    textController.clear();
    chosenEmoji = '😐';
    updateMoodUI('😐');
    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ Запись сохранена!'), duration: Duration(seconds: 1)));

    Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentBgColor,
      appBar: AppBar(title: const Text('Дневник настроения')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                currentPhrase,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _moodButton('😄'),
                _moodButton('😐'),
                _moodButton('😢'),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: textController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Напиши пару слов...',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveRecord,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 215, 228),
                foregroundColor: Colors.white,
              ),
              child: const Text('Сохранить запись'),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HistoryScreen()),
                );
              },
              icon: const Icon(Icons.history),
              label: const Text('Посмотреть записи'),
            ),
          ],
        ),
      ),
    );
  }

  // Кнопка-эмодзи
  Widget _moodButton(String emoji) {
    bool isSelected = chosenEmoji == emoji;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.pink.shade100 : Colors.white,
        side: BorderSide(color: isSelected ? const Color.fromARGB(255, 248, 219, 228) : Colors.grey.shade300),
      ),
      onPressed: () {
        chosenEmoji = emoji;
        updateMoodUI(emoji);
        setState(() {});
      },
      child: Text(emoji, style: const TextStyle(fontSize: 28)),
    );
  }
}