// ignore_for_file: prefer_const_constructors

import 'package:clear_insight/clear_insight.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';
import '../test_base.dart';

void main() {
  group('Log Event, not initialized', () {
    test('calling logEvent should throw an error', () {
      expect(
        () => ClearInsight.instance.logEvent(TestEvents.simpleEvent),
        throwsAssertionError,
      );
    });
  });
  group('Log Event, initialized', () {
    setUp(setupClearInsight);

    test('calling logEvent should not throw an error', () {
      expect(
        () => ClearInsight.instance.logEvent(TestEvents.simpleEvent),
        returnsNormally,
      );
    });
    test(
      'calling logEvent (with parameters) should not throw an error',
      () {
        expect(
          () => ClearInsight.instance.logEvent(TestEvents.eventWithParameters),
          returnsNormally,
        );
      },
    );
  });
}
