import 'package:clear_insight/src/core/services.dart';

/// The Clear Insight Model
/// This is used to log events
/// This class is used internally by the library
class ClearInsightModel {
  /// The Clear Insight Model constructor
  ClearInsightModel({
    required ClearInsightServices services,
  }) : _services = services;

  final ClearInsightServices _services;

  /// Validate a project id
  /// This method is used internally by the library
  /// This method is used to validate a project id
  bool isValidProjectId(String projectId) {
    return _services.project.isValidProjectId(projectId);
  }
}
