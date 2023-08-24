import 'package:clear_insight/src/core.dart';

abstract interface class EventSubmitter {
  Future<void> submit(EventRecord event);
}
