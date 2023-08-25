import 'package:clear_insight/src/core/platform_type.dart';

/// The Platform Model
class PlatformModel {
  /// The Platform Model constructor
  PlatformModel({
    required this.version,
    required this.type,
    required this.debug,
  });

  /// The version
  final String version;

  /// The platform
  PlatformType type;

  /// If the app is in debug mode
  bool debug;
}
