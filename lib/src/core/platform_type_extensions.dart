import 'package:clear_insight/src/core/platform_type.dart';
import 'package:flutter/foundation.dart';

/// The Target Platform Extensions
extension TargetPlatformExtensions on TargetPlatform {
  /// The Platform Type
  PlatformType get platformType {
    return switch (this) {
      (TargetPlatform.android) => PlatformType.android,
      (TargetPlatform.fuchsia) => PlatformType.fuchsia,
      (TargetPlatform.iOS) => PlatformType.iOS,
      (TargetPlatform.linux) => PlatformType.linux,
      (TargetPlatform.macOS) => PlatformType.macOS,
      (TargetPlatform.windows) => PlatformType.windows,
    };
  }
}

/// The Platform Type Extensions
extension PlatformTypeExtensions on PlatformType {
  /// The name of the platform
  String get name {
    return switch (this) {
      (PlatformType.android) => 'android',
      (PlatformType.fuchsia) => 'fuchsia',
      (PlatformType.iOS) => 'iOS',
      (PlatformType.linux) => 'linux',
      (PlatformType.macOS) => 'macOS',
      (PlatformType.windows) => 'windows',
    };
  }
}
