import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Initial Smoke Test', () {
    final name = 'Chef Portal';
    expect(name, contains('Chef'));
  });
}
