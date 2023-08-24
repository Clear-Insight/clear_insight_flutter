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
          id: 'd6f66e66-1878-4df2-b353-11bec936a959',
          parameters: {
            'current_count': currentCount,
            'next_count': nextCount,
          },
          name: 'counter_incremented',
        ),
      );

  void logTextTapped({
    required int currentCount,
  }) =>
      logEvent(
        (
          id: '45bb7d8e-cc25-49db-a358-8bfe59cbd041',
          parameters: {
            'current_count': currentCount,
          },
          name: 'text_tapped',
        ),
      );
}
