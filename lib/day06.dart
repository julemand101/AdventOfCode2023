// --- Day 6: Wait For It ---
// https://adventofcode.com/2023/day/6

int solveA(Iterable<String> input) => solve(input, kerning: false);

int solveB(Iterable<String> input) => solve(input, kerning: true);

int solve(Iterable<String> input, {required bool kerning}) {
  int attemptsCountProduct = 1;

  for (final record in parseInput(input, kerning)) {
    int maxAttempts = record.time;
    int successfulAttempts = 0;

    // Start at 1 since we skip step 0 where we don't press button at all since
    // we would never win that attempt
    for (var attemptSpeed = 1; attemptSpeed < maxAttempts; attemptSpeed++) {
      int timeLeft = maxAttempts - attemptSpeed;

      if (attemptSpeed * timeLeft > record.distance) {
        successfulAttempts++;
      }
    }

    attemptsCountProduct *= successfulAttempts;
  }

  return attemptsCountProduct;
}

typedef RaceRecord = ({int time, int distance});

List<RaceRecord> parseInput(Iterable<String> input, bool kerning) {
  List<int> times = [];
  List<int> distances = [];
  RegExp extractNumbers = RegExp(r'\d+');

  for (final line in input) {
    if (line.startsWith('Time:')) {
      times.addAll(
        extractNumbers.allMatches(line).map((match) => int.parse(match[0]!)),
      );
    } else if (line.startsWith('Distance:')) {
      distances.addAll(
        extractNumbers.allMatches(line).map((match) => int.parse(match[0]!)),
      );
    }
  }

  if (times.length != distances.length) {
    throw Exception('$times not have same amount of elements as $distances');
  }

  if (kerning) {
    return [
      (time: int.parse(times.join()), distance: int.parse(distances.join())),
    ];
  } else {
    return [
      for (var i = 0; i < times.length; i++)
        (time: times[i], distance: distances[i]),
    ];
  }
}
