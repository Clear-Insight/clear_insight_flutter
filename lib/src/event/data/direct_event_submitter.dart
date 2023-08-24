import 'package:clear_insight/src/_event.dart';
import 'package:clear_insight/src/core/network.dart';
import 'package:clear_insight/src/core/records.dart';

class DirectEventSubmitter implements EventSubmitter {
  DirectEventSubmitter({
    required ClearInsightApiClient apiClient,
  }) : _apiClient = apiClient;

  final ClearInsightApiClient _apiClient;

  @override
  Future<void> submit(EventRecord data) async => _apiClient.sendEvent(data);
}
