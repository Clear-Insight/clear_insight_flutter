import 'package:clear_insight/src/_screen.dart';
import 'package:clear_insight/src/core/data_model.dart';
import 'package:clear_insight/src/core/network.dart';
import 'package:clear_insight/src/screen/_data.dart';

/// The Screen View Submitter
class DirectScreenViewSubmitter implements ScreenViewSubmitter {
  /// The Screen View Submitter constructor
  DirectScreenViewSubmitter({
    required ClearInsightApiClient apiClient,
  }) : _apiClient = apiClient;

  final ClearInsightApiClient _apiClient;

  @override
  Future<void> submit(
    DataModel<ScreenViewModel> data,
  ) async =>
      _apiClient.sendScreenView(data);
}
