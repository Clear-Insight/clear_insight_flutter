import 'dart:convert';

import 'package:clear_insight/src/_event.dart';
import 'package:clear_insight/src/_screen.dart';
import 'package:clear_insight/src/core/data_model.dart';
import 'package:http/http.dart';

/// Client for the Clear Insight API.
class ClearInsightApiClient {
  /// Creates a new client.
  ClearInsightApiClient({
    required ClearInsightClient client,
  }) : _client = client;

  final ClearInsightClient _client;

  static const String _host = 'https://enbizgyrjivkg.x.pipedream.net';

  /// Sends an event to the Clear Insight API.
  Future<void> sendEvent(DataModel<EventModel> dataRecord) async {
    final request = Request('POST', _url('/events'))
      ..body = dataRecord.toEventBody;
    await _client.send(request);
  }

  /// Sends an screen view to the Clear Insight API.
  Future<void> sendScreenView(DataModel<ScreenViewModel> dataRecord) async {
    final request = Request('POST', _url('/screenview'))
      ..body = dataRecord.toScreenViewBody;
    await _client.send(request);
  }

  Uri _url(String path) => Uri.parse('$_host$path');
}

/// Client that adds the Clear Insight project ID to requests.
class ClearInsightClient extends BaseClient {
  /// Creates a new client.
  ClearInsightClient({
    required Client inner,
  }) : _inner = inner;

  final Client _inner;
  String? _projectId;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    assert(
      _projectId != null,
      'ClearInsight should be initialized before sending requests',
    );
    request.headers['x-clear-insight-project-id'] = _projectId!;
    return _inner.send(request);
  }

  /// Sets the project ID.
  set projectId(String projectId) {
    _projectId = projectId;
  }

  /// Gets the project ID.
  String get projectId => _projectId!;
}

extension on DataModel<ScreenViewModel> {
  String get toScreenViewBody {
    return json.encode(
      {
        'project_id': projectId,
        'screen_view': {
          'name': data.name,
        },
        'platform': {
          'version': platform.version,
          'type': platform.type.name,
          'debug': platform.debug,
        },
      },
    );
  }
}

extension on DataModel<EventModel> {
  String get toEventBody {
    return json.encode(
      {
        'project_id': projectId,
        'event': {
          'id': data.id,
          'name': data.name,
          'parameters': data.parameters,
        },
        'platform': {
          'version': platform.version,
          'type': platform.type.name,
          'debug': platform.debug,
        },
      },
    );
  }
}
