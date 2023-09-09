import 'package:clear_insight/clear_insight.dart';
import 'data.dart';

void setupClearInsight({
  bool invalidProjectId = false,
}) {
  var projectId = TestConstants.testProjectId;
  if (invalidProjectId) {
    projectId = TestConstants.testProjectIdInvalid;
  }
  ClearInsight.instance.init(
    projectId: projectId,
  );
}
