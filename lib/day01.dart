// --- Day 1: Calorie Counting ---
// https://adventofcode.com/2022/day/1

int solveA(Iterable<String> input) => getSortedSums(input).first;

int solveB(Iterable<String> input) =>
    getSortedSums(input).take(3).reduce((a, b) => a + b);

List<int> getSortedSums(Iterable<String> input) {
  List<int> sums = [];
  int tmpSum = 0;

  for (final line in input.followedBy(const [''])) {
    if (line.isEmpty) {
      sums.add(tmpSum);
      tmpSum = 0;
    } else {
      tmpSum += int.parse(line);
    }
  }

  return sums..sort((a, b) => b.compareTo(a));
}
