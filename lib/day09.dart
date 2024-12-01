// --- Day 9: Mirage Maintenance ---
// https://adventofcode.com/2023/day/9

enum Part { a, b }

int solveA(Iterable<String> input) => solve(input, part: Part.a);
int solveB(Iterable<String> input) => solve(input, part: Part.b);

int solve(Iterable<String> input, {required Part part}) {
  var sum = 0;

  for (final line in input) {
    final List<List<int>> history = [
      [...line.split(' ').map(int.parse)],
    ];

    while (!history.last.every((i) => i == 0)) {
      final lastHistoryList = history.last;

      history.add([
        for (var i = 1; i < lastHistoryList.length; i++)
          (lastHistoryList[i] - lastHistoryList[i - 1]),
      ]);
    }

    if (part == Part.a) {
      history.last.add(0);
    } else {
      history.last.insert(0, 0);
    }

    for (var i = history.length - 2; i >= 0; i--) {
      if (part == Part.a) {
        history[i].add(history[i].last + history[i + 1].last);
      } else {
        history[i].insert(0, history[i].first - history[i + 1].first);
      }
    }

    if (part == Part.a) {
      sum += history[0].last;
    } else {
      sum += history[0].first;
    }
  }

  return sum;
}
