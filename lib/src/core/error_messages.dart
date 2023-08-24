import 'package:clear_insight/src/log.dart';

/// Error messages used in the library
/// This is used to provide more information about errors
/// that occur in the library
abstract class ErrorMessages {
  /// Error message when InsightBolt is not initialized
  static const LogMessageRecords notInitialized = (
    label: 'InsightBolt has not been initialized',
    message: 'Please call InsightBolt.init() before using any other methods'
  );

  /// Error message when the project ID is invalid
  static const LogMessageRecords invalidProjectId = (
    label: 'Invalid project ID',
    message: 'The project ID provided is invalid',
  );
}
