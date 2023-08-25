import 'package:clear_insight/src/_event.dart';
import 'package:clear_insight/src/core/data_model.dart';

/// The Event Submitter
// ignore: one_member_abstracts
abstract interface class EventSubmitter {
  /// The Event Submitter constructor
  Future<void> submit(DataModel<EventModel> event);
}
