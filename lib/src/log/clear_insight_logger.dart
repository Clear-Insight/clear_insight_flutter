// ignore_for_file: lines_longer_than_80_chars

import 'package:clear_insight/src/core/_constants.dart';
import 'package:clear_insight/src/core/records.dart';
import 'package:clear_insight/src/log.dart';

part 'clear_insight_logger_impl.dart';

/// The Clear Insight Logger
abstract class ClearInsightLogger {
  static final ClearInsightLogger _instance =
      ClearInsightLoggerImplementation();

  /// The Clear Insight Logger instance
  static final ClearInsightLogger instance = _instance;

  /// Enable debug mode
  void enableDebugMode();

  /// Disable debug mode
  void disableDebugMode();

  /// Log an event
  void logEvent(EventRecord eventRecord, DateTime timestamp);

  /// Log the current screen
  void logCurrentScreen(ScreenViewRecord screenViewRecord, DateTime timestamp);

  /// Log an error
  void logError(String message, {required Object error});

  /// Log an info message
  void logWarning(String message, String warning);

  /// Log a warning message
  void logCritical(String message, String critical);
}
