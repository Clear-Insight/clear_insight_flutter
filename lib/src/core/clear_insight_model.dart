import 'dart:async';

import 'package:clear_insight/src/_event.dart';
import 'package:clear_insight/src/core/records.dart';
import 'package:clear_insight/src/project.dart';

/// The Clear Insight Model
/// This is used to log events
/// This class is used internally by the library
class ClearInsightModel {
  /// The Clear Insight Model constructor
  ClearInsightModel({
    required EventModel eventModel,
    required ProjectModel projectModel,
  })  : _eventModel = eventModel,
        _projectModel = projectModel;

  final EventModel _eventModel;
  final ProjectModel _projectModel;

  /// Log an event
  /// This will log an event to the console
  /// This method is used internally by the library
  void logEvent(DataRecord<EventRecord> eventRecord) {
    unawaited(_eventModel.logEvent(eventRecord));
  }

  /// Validate a project id
  /// This method is used internally by the library
  /// This method is used to validate a project id
  bool isValidProjectId(String projectId) {
    return _projectModel.isValidProjectId(projectId);
  }
}
