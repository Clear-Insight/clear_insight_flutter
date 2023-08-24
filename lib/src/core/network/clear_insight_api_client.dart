import 'dart:convert';

import 'package:clear_insight/src/core/records.dart';
import 'package:http/http.dart';

/// Client for the Clear Insight API.
class ClearInsightApiClient {
  /// Creates a new client.
  ClearInsightApiClient({
    required ClearInsightClient client,
  }) : _client = client;

  final ClearInsightClient _client;

  static const String _host = 'https://en1asyd4lt1e1.x.pipedream.net';

  /// Sends an event to the Clear Insight API.
  Future<void> sendEvent(DataRecord<EventRecord> dataRecord) async {
    final request = Request('POST', _url('/events'))..body = dataRecord.toEventBody;
    await _client.send(request);
  }

  Uri _url(String path) => Uri.parse('$_host$path');
}

/// Client that adds the Clear Insight project ID to requests.
class ClearInsightClient extends BaseClient {
  /// Creates a new client.
  ClearInsightClient({
    required Client inner,
    required String projectId,
  })  : _inner = inner,
        _projectId = projectId;

  final Client _inner;
  final String _projectId;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['x-clear-insight-project-id'] = _projectId;
    return _inner.send(request);
  }
}

extension on DataRecord<EventRecord> {
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
