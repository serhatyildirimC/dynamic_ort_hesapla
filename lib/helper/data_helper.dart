import 'package:flutter/material.dart';

class DataHelper {
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

  static double _letterToNotes(String harf) {
    switch (harf) {
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

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _letterNotes()
        .map((e) => DropdownMenuItem(
              value: _letterToNotes(e),
              child: Text(e),
            ))
        .toList();
  }
}
