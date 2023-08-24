import 'package:clear_insight/src/core/platform_type.dart';
import 'package:flutter/foundation.dart';

extension PlatformTypeExtensions on TargetPlatform {
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
