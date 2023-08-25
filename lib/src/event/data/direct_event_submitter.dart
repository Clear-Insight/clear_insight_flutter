import 'package:clear_insight/src/_event.dart';
import 'package:clear_insight/src/core/data_model.dart';
import 'package:clear_insight/src/core/network.dart';

/// The Event Submitter
class DirectEventSubmitter implements EventSubmitter {
  /// The Event Submitter constructor
  DirectEventSubmitter({
    required ClearInsightApiClient apiClient,
  }) : _apiClient = apiClient;

  final ClearInsightApiClient _apiClient;

  @override
  Future<void> submit(
    DataModel<EventModel> data,
  ) async =>
      _apiClient.sendEvent(data);
}
