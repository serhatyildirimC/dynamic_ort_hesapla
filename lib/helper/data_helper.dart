import 'package:dynamic_ort_hesapla/model/lesson.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Lesson> allLessons = [];
  static addLesson(Lesson lesson) {
    allLessons.add(lesson);
  }

  static calculateAvarage() {
    double totalNote = 0;
    double totalCredi = 0;

    for (var element in allLessons) {
      totalNote = totalNote + (element.credi * element.letterNote);
      totalCredi += element.credi;
    }
    return totalNote / totalCredi;
  }

  static List<String> _letterNotes() {
    return [
      'AA',
      'BA',
      'BB',
      'CB',
      'CC',
      'DC',
      'DD',
      'FD',
      'FF',
    ];
  }

  static double _letterToNotes(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;
    }
    return 1;
  }

  static String notesToLetter(double note) {
    if (note == 4) {
      return 'AA';
    } else if (note == 3.5) {
      return 'BB';
    } else if (note == 3.0) {
      return 'BA';
    } else if (note == 2.5) {
      return 'CB';
    } else if (note == 2.0) {
      return 'CC';
    } else if (note == 1.5) {
      return 'DC';
    } else if (note == 1.0) {
      return 'DD';
    } else if (note == 0.5) {
      return 'FD';
    } else {
      return 'FF';
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _letterNotes()
        .map((e) => DropdownMenuItem(
              value: _letterToNotes(e),
              child: Text(e),
            ))
        .toList();
  }

  static List<int> _credits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumKrediler() {
    return _credits()
        .map((e) => DropdownMenuItem(
              value: e.toDouble(),
              child: Text(e.toString()),
            ))
        .toList();
  }
}
