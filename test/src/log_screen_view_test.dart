// ignore_for_file: prefer_const_constructors

import 'package:clear_insight/clear_insight.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';
import '../test_base.dart';

void main() {
  group('Log Screen View, not initialized', () {
    test('when not initialized, calling logScreen should throw an error', () {
      expect(
        () => ClearInsight.instance.setCurrentScreen(
          TestScreenViews.simpleScreenView,
        ),
        throwsAssertionError,
      );
    });
  });
  group('Log Screen View, initialized', () {
    setUp(setupClearInsight);

    test('when initialized, calling logScreen should not throw an error', () {
      expect(
        () => ClearInsight.instance.setCurrentScreen(
          TestScreenViews.simpleScreenView,
        ),
        returnsNormally,
      );
    });
  });
}
