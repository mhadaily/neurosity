import 'package:neurosity_flutter/neurosity_flutter.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = NeurosityWidget();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
