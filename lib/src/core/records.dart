import 'package:clear_insight/src/core/platform_type.dart';

/// DataRecord is a record of data that is logged to the console.
typedef DataRecord<T> = ({T data, String projectId, PlatformRecord platform});

/// EventRecord is a record of an event that is logged to the console.
typedef EventRecord = ({
  /// The ID of the event. This is required. As it needs to correspond to the
  /// event ID in the console.
  String id,

  /// The parameters to log with this event. This can be null.
  Map<String, dynamic>? parameters,

  /// The name of the event. This is only used for debugging purposes.
  String? name,
});

/// PlatformRecord is a record of the platform that the application is running
/// on.
typedef PlatformRecord = ({
  /// The version of the operating system.
  String version,

  /// The type of the target platform.
  PlatformType type,

  /// Whether the application is running in debug mode.
  bool debug,
});
