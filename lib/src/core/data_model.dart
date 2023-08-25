import 'package:clear_insight/src/core/platform_model.dart';

/// The Data Model
class DataModel<T> {
  /// The Data Model constructor
  DataModel({
    required this.data,
    required this.projectId,
    required this.platform,
  });

  /// The data to be sent
  final T data;

  /// The project id
  final String projectId;

  /// The platform
  final PlatformModel platform;
}
