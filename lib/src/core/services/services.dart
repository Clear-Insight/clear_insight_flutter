import 'package:clear_insight/src/_event.dart';
import 'package:clear_insight/src/core/network.dart';
import 'package:http/http.dart';

class ClearInsightServices {
  ClearInsightServices() {
    _setupServices();
  }

  void _setupServices() {
    _instances
      ..set<EventModel>(EventModel(services: this))
      ..set<ClearInsightApiClient>(
        ClearInsightApiClient(
          client: ClearInsightClient(
            inner: Client(),
            projectId: '123',
          ),
        ),
      )
      ..set<EventSubmitter>(
        DirectEventSubmitter(apiClient: apiClient),
      );
  }

  ClearInsightApiClient get apiClient => _instances.get<ClearInsightApiClient>();

  EventModel get eventModel => _instances.get<EventModel>();

  EventSubmitter get eventSubmitter => _instances.get<EventSubmitter>();

  final Expando<Object> _instances = Expando<Object>('Registry');
}

extension on Expando<Object> {
  void set<T>(Object? instance, {bool lazy = false, bool replace = false}) {
    assert(!(this[T] != null && !replace), 'Instance of type $T is already added to the Registry');
    this[T] = instance;
  }

  T get<T>() {
    final instance = this[T];
    if (instance == null) {
      throw ArgumentError('Instance of type $T was not added to the Registry');
    }
    return instance as T;
  }
}
