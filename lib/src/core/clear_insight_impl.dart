part of 'clear_insight.dart';

class _ClearInsightImplementation implements ClearInsight {
  _ClearInsightImplementation({
    required ClearInsightModel model,
    required ClearInsightServices services,
  })  : _model = model,
        _services = services;

  final ClearInsightModel _model;
  final ClearInsightServices _services;
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
  final _platform = PlatformModel(
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
    _services.client.projectId = projectId;
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
    final logTimestamp = DateTime.now();
    if (_enableDebug) _logger.logEvent(event, logTimestamp);
    final parameters = <ParameterModel>[];
    event.parameters?.forEach(
      (id, parameter) {
        parameters.add(
          ParameterModel(
            id: id,
            name: parameter.name,
            value: parameter.value.toString(),
          ),
        );
      },
    );
    final eventModel = EventModel(
      id: event.id,
      name: event.name,
      parameters: parameters,
    );
    final dataModel = DataModel(
      data: eventModel,
      projectId: _projectId,
      platform: _platform,
      timestamp: logTimestamp,
    );
    unawaited(_services.eventSubmitter.submit(dataModel));
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

  @override
  void setCurrentScreen(ScreenViewRecord screenView) {
    if (!validateInitialized()) return;
    final logTimestamp = DateTime.now();
    if (_enableDebug) _logger.logCurrentScreen(screenView, logTimestamp);
    final eventModel = ScreenViewModel(
      name: screenView.name,
      path: screenView.path,
    );
    final dataModel = DataModel(
      data: eventModel,
      projectId: _projectId,
      platform: _platform,
      timestamp: logTimestamp,
    );
    unawaited(_services.screenViewSubmitter.submit(dataModel));
  }
}
