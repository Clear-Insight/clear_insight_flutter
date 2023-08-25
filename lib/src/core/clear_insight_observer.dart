import 'package:clear_insight/clear_insight.dart';
import 'package:flutter/widgets.dart';

/// The Clear Insight Observer
/// The Clear Insight Observer is used to send screen views
class ClearInsightObserver extends RouteObserver<ModalRoute<dynamic>> {
  final _clearInsight = ClearInsight.instance;

  void _sendScreenView(Route<dynamic> route) {
    final screenName = route.settings.name;
    if (screenName != null) {
      _clearInsight.setCurrentScreen(screenName: screenName);
    }
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
