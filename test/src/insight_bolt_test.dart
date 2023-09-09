// ignore_for_file: prefer_const_constructors

import 'package:clear_insight/clear_insight.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_base.dart';

void main() {
  group('ClearInsight, not initialized', () {
    test('when not initialized, isInitialized value should be false', () {
      expect(ClearInsight.instance.isInitialized, false);
    });
  });
  group('ClearInsight, initialized invalid project id', () {
    setUp(() => setupClearInsight(invalidProjectId: true));

    test('when initialized, isInitialized value should be false', () {
      expect(ClearInsight.instance.isInitialized, false);
    });
  });
  group('ClearInsight, initialized', () {
    setUp(setupClearInsight);
    test('enableDebug should be true by default in tests', () {
      expect(ClearInsight.instance.isDebug, true);
    });
    test('when initialized, isInitialized value should be true', () {
      expect(ClearInsight.instance.isInitialized, true);
    });
    test('enableDebug should be false when set to false', () {
      ClearInsight.instance.disableDebug();
      expect(ClearInsight.instance.isDebug, false);
    });
    test('enableDebug should be true when set to true', () {
      ClearInsight.instance.enableDebug();
      expect(ClearInsight.instance.isDebug, true);
    });
  });
}
