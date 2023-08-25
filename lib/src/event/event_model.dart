/// The Event Model
/// This is used to log events
class EventModel {
  /// The Event Model constructor
  EventModel({
    required this.id,
    this.name,
    this.parameters,
  });

  /// The event id
  final String id;

  /// The event name
  String? name;

  /// The event parameters
  Map<String, dynamic>? parameters;
}
