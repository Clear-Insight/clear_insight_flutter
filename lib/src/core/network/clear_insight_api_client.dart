import 'dart:convert';

import 'package:clear_insight/src/core/records.dart';
import 'package:http/http.dart';

class ClearInsightApiClient {
  ClearInsightApiClient({required ClearInsightClient client}) : _client = client;

  final ClearInsightClient _client;

  static const String _host = 'https://en1asyd4lt1e1.x.pipedream.net';

  Future<void> sendEvent(EventRecord event) async {
    final request = Request('POST', _url('/events'))..body = event.toEventBody;
    await _client.send(request);
  }

  Uri _url(String path) => Uri.parse('$_host$path');
}

class ClearInsightClient extends BaseClient {
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

extension EventBody on EventRecord {
  String get toEventBody {
    return json.encode(
      {
        'event': {
          'id': id,
          'name': name,
          'parameters': parameters,
        },
      },
    );
  }
}
