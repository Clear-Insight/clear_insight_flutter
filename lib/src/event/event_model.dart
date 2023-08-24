import 'package:clear_insight/src/core/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:clear_insight/src/core/records.dart';

/// The Event Model
/// This is used to log events
class EventModel {
  EventModel({
    required ClearInsightServices services,
  }) : _services = services;

  final ClearInsightServices _services;

  /// Log an event
  /// This will log an event to the console
  Future<void> logEvent(DataRecord<EventRecord> eventRecord) async {
    if (kDebugMode) {
      await _services.eventSubmitter.submit(
        eventRecord.data,
      );
    }
  }
}
