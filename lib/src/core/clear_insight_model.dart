import 'dart:async';

import 'package:clear_insight/src/_event.dart';
import 'package:clear_insight/src/core/records.dart';
import 'package:clear_insight/src/project.dart';
import 'package:flutter/material.dart';

class ClearInsightModel with ChangeNotifier {
  ClearInsightModel({
    required EventModel eventModel,
    required ProjectModel projectModel,
  })  : _eventModel = eventModel,
        _projectModel = projectModel;

  final EventModel _eventModel;
  final ProjectModel _projectModel;

  void logEvent(DataRecord<EventRecord> eventRecord) {
    unawaited(_eventModel.logEvent(eventRecord));
  }

  bool isValidProjectId(String projectId) {
    return _projectModel.isValidProjectId(projectId);
  }
}
