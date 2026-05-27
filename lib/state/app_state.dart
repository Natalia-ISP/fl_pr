import 'package:flutter/material.dart';
import '../models/mood_record.dart';

List<MoodRecord> journal = [];
String currentPhrase = "Выбери своё настроение! ✨";
Color currentBgColor = const Color.fromARGB(255, 241, 241, 241);

void updateMoodUI(String emoji) {
  switch (emoji) {
    case '😄':
      currentPhrase = "Мы рады, что у тебя всё отлично! 🌟";
      currentBgColor = const Color.fromARGB(255, 255, 250, 210);
      break;
    case '😐':
      currentPhrase = "Обычный день - тоже хорошо. Держи ровный темп! ☕";
      currentBgColor = const Color.fromARGB(255, 230, 230, 230);
      break;
    case '😢':
      currentPhrase = "Всё наладится. Ты сильнее, чем думаешь. 💙";
      currentBgColor = const Color.fromARGB(255, 204, 232, 255);
      break;
  }
}