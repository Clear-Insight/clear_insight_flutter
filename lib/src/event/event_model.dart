import 'package:clear_insight/src/_event.dart';

/// The Event Model
/// This is used to log events
class EventModel {
  /// The Event Model constructor
  EventModel({
    required this.id,
    required this.parameters,
    this.name,
  });

  /// The event id
  final String id;

  /// The event name
  String? name;

  /// The event parameters
  List<ParameterModel> parameters;
}
