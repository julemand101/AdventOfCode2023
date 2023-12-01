// --- Day 1: Trebuchet?! ---
// https://adventofcode.com/2023/day/1

int solveA(Iterable<String> input) => input.fold(0, (sum, line) {
      int? firstDigit, secondDigit;

      for (var i = 0; i < line.length; i++) {
        int? parsed = int.tryParse(line[i]);

        if (parsed != null) {
          if (firstDigit == null) {
            firstDigit = parsed;
          } else {
            secondDigit = parsed;
          }
        }
      }

      secondDigit ??= firstDigit;

      return sum + int.parse('$firstDigit$secondDigit');
    });

const List<String> numberStrings = [
  'zero',
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

int solveB(Iterable<String> input) => input.fold(0, (sum, line) {
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

      return sum + int.parse('$firstDigit$secondDigit');
    });
