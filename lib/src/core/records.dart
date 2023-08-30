import 'package:clear_insight/src/core/platform_type.dart';

/// EventRecord is a record of an event that is logged to the console.
typedef EventRecord = ({
  /// The ID of the event. This is required. As it needs to correspond to the
  /// event ID in the console.
  String id,

  /// The parameters to log with this event. This can be null.
  Map<String, ParameterRecord>? parameters,

  /// The name of the event. This is only used for debugging purposes.
  String? name,
});

/// ParameterRecord is a record of a parameter that is logged to the console.
typedef ParameterRecord = ({
  /// The name of the parameter. This is required. As it needs to correspond to
  /// the parameter name in the console.
  String name,

  /// The value of the parameter. This can be null.
  dynamic value,
});

/// ScreenViewRecord is a record of a screen view that is logged to the
/// console.
typedef ScreenViewRecord = ({
  /// The name of the screen view. This is required. As it needs to correspond
  /// to the screen view name in the console.
  String name,

  /// The path of the screen view.
  String path,
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
