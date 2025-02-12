import 'dart:io';

const year = '2023';

void main(List<String> args) {
  if (args.length != 2) {
    print('Please call with: <dayNumber> <dayTitle>');
    return;
  }

  final [dayNumber, dayTitle] = args;
  final paddedDayNumber = dayNumber.padLeft(2, '0');

  // Create lib file
  final dayFileName = 'day$paddedDayNumber.dart';

  File('lib/$dayFileName').writeAsString('''
// --- Day $dayNumber: $dayTitle ---
// https://adventofcode.com/$year/day/$dayNumber

int solveA(Iterable<String> input) {
  return 0;
}
''');

  // Create empty test data file
  final dataPath = 'test/data/day$paddedDayNumber.txt';
  File(dataPath).create();

  // Create unit tests
  File('test/day${paddedDayNumber}_test.dart').writeAsString('''
// --- Day $dayNumber: $dayTitle ---
// https://adventofcode.com/$year/day/$dayNumber

import 'dart:io';
import 'package:advent_of_code_$year/$dayFileName';
import 'package:advent_of_code_$year/util.dart';
import 'package:test/test.dart';

final input = File('$dataPath').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r\'\'\'
<SomeLines>
\'\'\'.asLines,
        ),
        equals(-1),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(-1));
    });
  });
}
''');
}
