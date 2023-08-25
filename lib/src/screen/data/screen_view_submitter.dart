import 'package:clear_insight/src/_screen.dart';
import 'package:clear_insight/src/core/data_model.dart';

/// The Screen View Submitter
// ignore: one_member_abstracts
abstract interface class ScreenViewSubmitter {
  /// The Screen View Submitter constructor
  Future<void> submit(DataModel<ScreenViewModel> event);
}
