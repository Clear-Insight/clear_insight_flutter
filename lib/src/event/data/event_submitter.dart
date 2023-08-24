import 'package:clear_insight/src/core/records.dart';

/// The Event Submitter
// ignore: one_member_abstracts
abstract interface class EventSubmitter {
  /// The Event Submitter constructor
  Future<void> submit(DataRecord<EventRecord> event);
}
