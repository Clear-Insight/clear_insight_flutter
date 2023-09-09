import 'dart:async';
import 'dart:io';
import 'package:clear_insight/src/_event.dart';
import 'package:clear_insight/src/_screen.dart';
import 'package:clear_insight/src/core/clear_insight_model.dart';
import 'package:clear_insight/src/core/data_model.dart';
import 'package:clear_insight/src/core/error_messages.dart';
import 'package:clear_insight/src/core/platform_model.dart';
import 'package:clear_insight/src/core/platform_type_extensions.dart';
import 'package:clear_insight/src/core/records.dart';
import 'package:clear_insight/src/core/services.dart';
import 'package:clear_insight/src/log.dart';
import 'package:flutter/foundation.dart';

part 'clear_insight_impl.dart';

/// The ClearInsight class
/// This is the main class for the library
/// ```dart
/// ClearInsight clearInsight = ClearInsight.instance;
/// ```
/// or
/// ```dart
/// ClearInsight clearInsight = ClearInsight.I;
/// ```
///
/// This class is abstract and cannot be instantiated
///
/// More information about getting started with ClearInsight can be found at [https://clearinsight.dev/docs/getting-started](https://clearinsight.dev/docs/getting-started)
abstract class ClearInsight {
  static final _services = ClearInsightServices();

  /// The Singleton instance
  /// This is only available after you call [ClearInsight.init]
  /// It is an error to call this getter before calling [ClearInsight.init]
  /// ```dart
  /// ClearInsight.instance;
  /// ```
  /// or
  /// ```dart
  /// ClearInsight.I;
  /// ```
  static final ClearInsight _instance = _ClearInsightImplementation(
    model: _services.model,
    services: _services,
  );

  /// Initialize the Singleton instance
  /// ```dart
  /// ClearInsight.init(projectId: 'YOUR_PROJECT_ID');
  /// ```
  void init({
    required String projectId,
    bool? enableDebug,
  });

  /// Log an event
  /// This is only available after you call [ClearInsight.init]
  /// And is used to log events with a pre-defined type
  void logEvent(EventRecord event);

  /// Log the current screen
  /// This is only available after you call [ClearInsight.init]
  /// And is used to log the current screen
  void setCurrentScreen(ScreenViewRecord screenView);

  /// Enable debug mode
  void enableDebug();

  /// Disable debug mode
  void disableDebug();

  /// Whether debug mode is enabled
  bool get isDebug;

  /// Access to the Singleton instance
  static ClearInsight get instance => _instance;

  /// If the instance has been initialized
  bool get isInitialized;
}
