// --- Day 3: Gear Ratios ---
// https://adventofcode.com/2023/day/3

int solveA(List<String> input) {
  var sum = 0;
  var numberNearSymbol = false;

  for (final (y, line) in input.indexed) {
    final sb = StringBuffer();

    for (final (x, char) in line.split('').indexed) {
      if (int.tryParse(char) case final number?) {
        if (numberNearSymbol || anySymbolAround(x, y, input)) {
          numberNearSymbol = true;
        }
        sb.write(number);
      } else {
        if (sb.isNotEmpty) {
          final number = int.parse(sb.toString());

          if (numberNearSymbol) {
            sum += number;
          }

          numberNearSymbol = false;
          sb.clear();
        }
      }
    }

    if (sb.isNotEmpty) {
      final number = int.parse(sb.toString());

      if (numberNearSymbol) {
        sum += number;
        numberNearSymbol = false;
      }

      sb.clear();
    }
  }

  return sum;
}

int solveB(List<String> input) {
  return 0;
}

bool anySymbolAround(int x, int y, List<String> input) =>
    safeCheck(x - 1, y - 1, input) ||
    safeCheck(x, y - 1, input) ||
    safeCheck(x + 1, y - 1, input) ||
    safeCheck(x - 1, y, input) ||
    safeCheck(x + 1, y, input) ||
    safeCheck(x - 1, y + 1, input) ||
    safeCheck(x, y + 1, input) ||
    safeCheck(x + 1, y + 1, input);

final regExp = RegExp(r'\.|\d');

bool safeCheck(int x, int y, List<String> input) =>
    (x >= 0 && x < input.first.length && y >= 0 && y < input.length)
        ? !regExp.hasMatch(input[y][x])
        : false;
