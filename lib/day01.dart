// --- Day 1: Trebuchet?! ---
// https://adventofcode.com/2023/day/1

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) =>
    input.map((line) => line.split('')).map((charList) {
      final firstDigit = charList.map(int.tryParse).nonNulls.first;
      final lastDigit = charList.reversed.map(int.tryParse).nonNulls.first;

      return firstDigit * 10 + lastDigit;
    }).sum;

const List<String> numberStrings = [
  'zero', // Added so index position in list matches the number as String
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
];

int solveB(Iterable<String> input) => input.map((line) {
      int? firstDigit;
      int? secondDigit;

      for (var i = 0; i < line.length; i++) {
        int? parsed = int.tryParse(line[i]);

        if (parsed != null) {
          if (firstDigit == null) {
            firstDigit = parsed;
          } else {
            secondDigit = parsed;
          }
        } else {
          for (final (int value, String string) in numberStrings.indexed) {
            if (i + string.length - 1 < line.length &&
                line.substring(i, i + string.length) == string) {
              if (firstDigit == null) {
                firstDigit = value;
              } else {
                secondDigit = value;
              }
            }
          }
        }
      }

      secondDigit ??= firstDigit;

      return int.parse('$firstDigit$secondDigit');
    }).sum;
