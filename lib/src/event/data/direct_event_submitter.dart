import 'package:clear_insight/src/_event.dart';
import 'package:clear_insight/src/core/network.dart';
import 'package:clear_insight/src/core/records.dart';

/// The Event Submitter
class DirectEventSubmitter implements EventSubmitter {
  /// The Event Submitter constructor
  DirectEventSubmitter({
    required ClearInsightApiClient apiClient,
  }) : _apiClient = apiClient;

  final ClearInsightApiClient _apiClient;

  @override
  Future<void> submit(
    DataRecord<EventRecord> data,
  ) async =>
      _apiClient.sendEvent(data);
}
