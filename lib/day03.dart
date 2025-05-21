// --- Day 3: Gear Ratios ---
// https://adventofcode.com/2023/day/3

int solveA(List<String> input) {
  var sum = 0;
  var numberNearSymbol = false;

  void numberDone(StringBuffer sb) {
    if (sb.isNotEmpty) {
      if (numberNearSymbol) {
        sum += int.parse(sb.toString());
        numberNearSymbol = false;
      }
      sb.clear();
    }
  }

  for (final (y, line) in input.indexed) {
    final sb = StringBuffer();

    for (final (x, char) in line.split('').indexed) {
      if (int.tryParse(char) case final number?) {
        if (numberNearSymbol || findSymbolsAround(x, y, input).isNotEmpty) {
          numberNearSymbol = true;
        }
        sb.write(number);
      } else {
        numberDone(sb);
      }
    }
    numberDone(sb);
  }

  return sum;
}

int solveB(List<String> input) {
  final gearNumberMap = <({int x, int y}), int>{};

  var sum = 0;
  FoundSymbol? gearSymbol;

  void numberDone(StringBuffer sb) {
    if (sb.isNotEmpty) {
      if (gearSymbol case final gearSymbol?) {
        final previousGearNumber = gearNumberMap[gearSymbol.point2D];
        final currentGearNumber = int.parse(sb.toString());

        if (previousGearNumber == null) {
          gearNumberMap[gearSymbol.point2D] = currentGearNumber;
        } else {
          sum += previousGearNumber * currentGearNumber;
        }
      }
      gearSymbol = null;
      sb.clear();
    }
  }

  for (final (y, line) in input.indexed) {
    final sb = StringBuffer();

    for (final (x, char) in line.split('').indexed) {
      if (int.tryParse(char) case final number?) {
        gearSymbol ??= findSymbolsAround(
          x,
          y,
          input,
        ).where((e) => e.symbol == '*').firstOrNull;

        sb.write(number);
      } else {
        numberDone(sb);
      }
    }
    numberDone(sb);
  }

  return sum;
}

typedef FoundSymbol = ({String symbol, ({int x, int y}) point2D});

List<FoundSymbol> findSymbolsAround(int x, int y, List<String> input) => [
  if (safeCheck(x - 1, y - 1, input) case final foundSymbol?) foundSymbol,
  if (safeCheck(x, y - 1, input) case final foundSymbol?) foundSymbol,
  if (safeCheck(x + 1, y - 1, input) case final foundSymbol?) foundSymbol,
  if (safeCheck(x - 1, y, input) case final foundSymbol?) foundSymbol,
  if (safeCheck(x + 1, y, input) case final foundSymbol?) foundSymbol,
  if (safeCheck(x - 1, y + 1, input) case final foundSymbol?) foundSymbol,
  if (safeCheck(x, y + 1, input) case final foundSymbol?) foundSymbol,
  if (safeCheck(x + 1, y + 1, input) case final foundSymbol?) foundSymbol,
];

final regExp = RegExp(r'\.|\d');

FoundSymbol? safeCheck(int x, int y, List<String> input) {
  if (x >= 0 && x < input.first.length && y >= 0 && y < input.length) {
    final char = input[y][x];

    if (!regExp.hasMatch(char)) {
      return (symbol: char, point2D: (x: x, y: y));
    }
  }
  return null;
}
