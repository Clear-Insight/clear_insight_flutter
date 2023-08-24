import 'package:clear_insight/src/core/records.dart';
import 'package:clear_insight/src/core/services/services.dart';

/// The Event Model
/// This is used to log events
class EventModel {
  /// The Event Model constructor
  EventModel({
    required ClearInsightServices services,
  }) : _services = services;

  final ClearInsightServices _services;

  /// Log an event
  /// This will log an event to the console
  Future<void> logEvent(DataRecord<EventRecord> eventRecord) async {
    await _services.eventSubmitter.submit(
      eventRecord,
    );
  }
}
