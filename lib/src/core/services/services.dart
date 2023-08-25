// ignore_for_file: lines_longer_than_80_chars

import 'package:clear_insight/src/_event.dart';
import 'package:clear_insight/src/core/clear_insight_model.dart';
import 'package:clear_insight/src/core/network.dart';
import 'package:clear_insight/src/project.dart';
import 'package:clear_insight/src/screen/_data.dart';
import 'package:clear_insight/src/screen/data/direct_screen_view_submitter.dart';
import 'package:http/http.dart';

/// A class that provides access to ClearInsight services.
class ClearInsightServices {
  /// The ClearInsightServices constructor
  ClearInsightServices() {
    _setupServices();
  }

  void _setupServices() => _instances
    ..set<ClearInsightClient>(
      ClearInsightClient(
        inner: Client(),
      ),
    )
    ..set<ClearInsightApiClient>(
      ClearInsightApiClient(
        client: _instances.get<ClearInsightClient>(),
      ),
    )
    ..set<EventSubmitter>(
      DirectEventSubmitter(apiClient: apiClient),
    )
    ..set<ScreenViewSubmitter>(
      DirectScreenViewSubmitter(apiClient: apiClient),
    )
    ..set<ClearInsightModel>(ClearInsightModel(services: this))
    ..set<ProjectModel>(ProjectModel());

  /// The ClearInsightApiClient
  ClearInsightApiClient get apiClient =>
      _instances.get<ClearInsightApiClient>();

  /// The ClearInsightClient
  ClearInsightClient get client => _instances.get<ClearInsightClient>();

  /// The EventModel
  EventModel get eventModel => _instances.get<EventModel>();

  /// The ProjectModel
  ProjectModel get project => _instances.get<ProjectModel>();

  /// The ClearInsightModel
  ClearInsightModel get model => _instances.get<ClearInsightModel>();

  /// The EventSubmitter
  EventSubmitter get eventSubmitter => _instances.get<EventSubmitter>();

  /// The ScreenViewSubmitter
  ScreenViewSubmitter get screenViewSubmitter =>
      _instances.get<ScreenViewSubmitter>();

  final Expando<Object> _instances = Expando<Object>('Registry');
}

extension on Expando<Object> {
  void set<T>(Object? instance, {bool lazy = false}) => this[T] = instance;

  T get<T>() {
    final instance = this[T];
    if (instance == null) {
      throw ArgumentError('Instance of type $T was not added to the Registry');
    }
    return instance as T;
  }
}
