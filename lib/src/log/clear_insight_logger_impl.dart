part of 'clear_insight_logger.dart';

const _emptyWhiteSpace = ' ';

/// The Clear Insight Logger Implementation
class ClearInsightLoggerImplementation implements ClearInsightLogger {
  bool _enableDebug = false;

  @override
  void logEvent(EventRecord eventRecord) {
    if (!_enableDebug) return;
    _log(
      'Submitted Event',
      [
        (label: 'ID', message: eventRecord.id),
        (label: 'Name', message: eventRecord.name ?? 'No name provided'),
        (label: 'Event', message: '${UrlConstants.eventBaseUrl}/${eventRecord.id}'),
        (label: 'Timestamp', message: DateTime.now().toString()),
        (label: 'Parameters', message: eventRecord.parameters.toString()),
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
      ..write(level.emoji)
      ..write(_emptyWhiteSpace)
      ..write('\x1B[37m')
      ..write(title)
      ..write('\x1B[0m');

    for (final message in messages) {
      buffer
        ..write('\n')
        ..write('\x1B[34m')
        ..write('[')
        ..write(message.label)
        ..write(']')
        ..write('\x1B[0m')
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
