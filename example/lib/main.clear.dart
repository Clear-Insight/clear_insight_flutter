// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ClearInsightGenerator
// **************************************************************************

import 'package:clear_insight/clear_insight.dart';

extension ClearInsightEventExtension on ClearInsight {
  void logCounterIncremented({
    required int currentCount,
    required int nextCount,
  }) =>
      logEvent(
        (
          id: '3e11acc2-fd48-4c7c-bb06-da65fa2e14f5',
          parameters: {
            'f58f3ad0-60b3-46b3-b7c2-8c0250dcfef1': (
              name: 'current_count',
              value: 'current_count',
            ),
            '95557045-4253-4387-a8e7-1fdca25f770a': (
              name: 'next_count',
              value: 'next_count',
            ),
          },
          name: 'counter_incremented',
        ),
      );

  void logTextTapped({
    required int currentCount,
  }) =>
      logEvent(
        (
          id: '87fc7fdc-65e7-44b0-93bd-9d876778a4c6',
          parameters: {
            '8a6267c5-2ffb-43f9-b967-16d5458d7f38': (
              name: 'current_count',
              value: 'current_count',
            ),
          },
          name: 'text_tapped',
        ),
      );
}
