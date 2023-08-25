import 'package:clear_insight/clear_insight.dart';
import 'package:flutter/widgets.dart';

/// The Clear Insight Observer
/// The Clear Insight Observer is used to send screen views
class ClearInsightObserver extends RouteObserver<ModalRoute<dynamic>> {
  final _clearInsight = ClearInsight.instance;

  void _sendScreenView(Route<dynamic> route) {
    var screenName = route.settings.name?.split('/').last;
    if (screenName == null || screenName.isEmpty) {
      screenName = 'main';
    }
    final screenPath = route.settings.name!;
    _clearInsight.setCurrentScreen(
      (
        name: screenName,
        path: screenPath,
      ),
    );
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _sendScreenView(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      _sendScreenView(previousRoute);
    }
  }
}
