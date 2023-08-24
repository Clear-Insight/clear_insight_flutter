part of 'clear_insight.dart';

class _ClearInsightImplementation implements ClearInsight {
  _ClearInsightImplementation({
    required ClearInsightModel model,
  }) : _model = model;

  final ClearInsightModel _model;
  final ClearInsightLogger _logger = ClearInsightLogger.instance;

  /// The project ID
  /// This is only available after you call [ClearInsight.init]
  /// It is an error to call this getter before calling [ClearInsight.init]
  ///
  /// Your project ID can be found in the [ClearInsight Dashboard](https://clearinsight.dev/dashboard)
  late String _projectId;

  /// Whether the instance has been initialized
  bool _isInitialized = false;

  /// Enable debug mode
  bool _enableDebug = kDebugMode;

  /// Platform information
  /// Contains the version, type and debug mode
  final _platform = (
    version: Platform.operatingSystemVersion,
    type: defaultTargetPlatform.platformType,
    debug: kDebugMode,
  );

  @override
  void init({
    required String projectId,
    bool? enableDebug,
  }) {
    _projectId = projectId;
    _enableDebug = enableDebug ?? _enableDebug;
    _setupLogMode();
    if (!_model.isValidProjectId(projectId)) {
      _logger.logError(
        ErrorMessages.invalidProjectId.label,
        error: ErrorMessages.invalidProjectId.message,
      );
      return;
    }

    _isInitialized = true;
  }

  bool validateInitialized() {
    if (!_isInitialized) {
      _logger.logError(
        ErrorMessages.notInitialized.label,
        error: ErrorMessages.notInitialized.message,
      );
      return false;
    }
    return true;
  }

  @override
  void logEvent(EventRecord event) {
    if (!validateInitialized()) return;
    if (_enableDebug) _logger.logEvent(event);
    _model.logEvent(
      (data: event, projectId: _projectId, platform: _platform),
    );
  }

  @override
  void disableDebug() {
    _enableDebug = false;
    _setupLogMode();
  }

  @override
  void enableDebug() {
    _enableDebug = true;
    _setupLogMode();
  }

  void _setupLogMode() {
    if (_enableDebug) {
      _logger.enableDebugMode();
    } else {
      _logger.disableDebugMode();
    }
  }
}
