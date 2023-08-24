import 'package:clear_insight/src/core/records.dart';
import 'package:clear_insight/src/log.dart';

part 'clear_insight_logger_impl.dart';

abstract class ClearInsightLogger {
  static final ClearInsightLogger _instance = ClearInsightLoggerImplementation();

  static final ClearInsightLogger instance = _instance;

  void enableDebugMode();

  void disableDebugMode();

  void logEvent(EventRecord eventRecord);

  void logError(String message, {required Object error});

  void logWarning(String message, String warning);

  void logCritical(String message, String critical);
}
