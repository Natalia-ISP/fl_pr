import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String chosenEmoji = '😐';
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Как ты себя чувствуешь?')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildEmojiButton('😄'),
                _buildEmojiButton('😐'),
                _buildEmojiButton('😢'),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Напиши пару слов...',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Сохранить')),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiButton(String emoji) {
    bool isSelected = chosenEmoji == emoji;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color.fromARGB(255, 255, 170, 198) : Colors.grey.shade200,
      ),
      onPressed: () {
        setState(() => chosenEmoji = emoji);
      },
      child: Text(emoji, style: const TextStyle(fontSize: 24)),
    );
  }
}