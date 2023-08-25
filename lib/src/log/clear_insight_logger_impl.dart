part of 'clear_insight_logger.dart';

const _emptyWhiteSpace = ' ';

/// The Clear Insight Logger Implementation
class ClearInsightLoggerImplementation implements ClearInsightLogger {
  bool _enableDebug = false;

  @override
  void logEvent(EventRecord eventRecord, DateTime timestamp) {
    if (!_enableDebug) return;
    _log(
      'Submitted Event',
      [
        (label: 'ID', message: eventRecord.id),
        (label: 'Name', message: eventRecord.name ?? 'No name provided'),
        (label: 'Parameters', message: eventRecord.parameters.toString()),
        (label: 'Timestamp', message: timestamp.toString()),
        (
          label: 'Link',
          message: '${UrlConstants.eventBaseUrl}/${eventRecord.id}'
        ),
      ],
    );
  }

  /// Log a message
  void _log(
    String title,
    List<LogMessageRecords> messages, {
    _LogLevel level = _LogLevel.info,
  }) {
    final buffer = StringBuffer()
      ..write('\n')
      ..write('┌──────────────────────────')
      ..write('\n')
      ..write('[')
      ..write(title)
      ..write(']')
      ..write(_emptyWhiteSpace)
      ..write(level.emoji);

    for (final message in messages) {
      buffer
        ..write('\n')
        ..write('[')
        ..write(message.label)
        ..write(']')
        ..write(_emptyWhiteSpace)
        ..write(message.message);
    }
    buffer
      ..write('\n')
      ..write('└──────────────────────────');
    // ignore: avoid_print
    print(buffer);
  }

  @override
  void logError(String message, {required Object error}) {
    _log(
      message,
      [
        (label: 'Error', message: error.toString()),
      ],
      level: _LogLevel.error,
    );
  }

  @override
  void logWarning(String message, String warning) {
    if (!_enableDebug) return;
    _log(
      message,
      [
        (label: 'Warning', message: warning),
      ],
      level: _LogLevel.warning,
    );
  }

  @override
  void logCritical(String message, String critical) {
    _log(
      message,
      [
        (label: 'Critical', message: critical),
      ],
      level: _LogLevel.critical,
    );
  }

  @override
  void enableDebugMode() {
    _enableDebug = true;
  }

  @override
  void disableDebugMode() {
    _enableDebug = false;
  }

  @override
  void logCurrentScreen(ScreenViewRecord screenViewRecord, DateTime timestamp) {
    if (!_enableDebug) return;
    _log(
      'Submitted Screen View',
      [
        (label: 'Name', message: screenViewRecord.name),
        (label: 'Path', message: screenViewRecord.path),
        (label: 'Timestamp', message: timestamp.toString()),
        (
          label: 'Link',
          message: '${UrlConstants.screenViewBaseUrl}/${screenViewRecord.name}'
        ),
      ],
    );
  }
}

enum _LogLevel {
  info(name: 'Info', emoji: 'ℹ️'),
  warning(name: 'Warning', emoji: '⚠️'),
  error(name: 'Error', emoji: '🚨'),
  critical(name: 'Critical', emoji: '🚩');

  const _LogLevel({
    required this.name,
    required this.emoji,
  });

  final String name;
  final String emoji;
}
