import 'package:clear_insight/clear_insight.dart';

abstract class TestEvents {
  static const EventRecord simpleEvent = (
    name: 'simple_event',
    id: 'simple_event_id',
    parameters: {},
  );

  static const EventRecord eventWithParameters = (
    name: 'event_with_parameters',
    id: 'event_with_parameters_id',
    parameters: {
      'param1_id': (
        name: 'param1',
        value: 'value1',
      ),
      'param2_id': (
        name: 'param2',
        value: 'value2',
      ),
    },
  );
}
