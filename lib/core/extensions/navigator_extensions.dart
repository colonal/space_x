import 'package:flutter/material.dart';

extension NavigatorExtension<T> on BuildContext {
  /// Push a new route onto the navigation stack
  Future<T?> push(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  /// Replace the current route with a new route
  Future<T?> pushReplacement(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  /// Pop the current route and push a new route
  Future<T?> popAndPush(String routeName, {Object? arguments}) =>
      Navigator.of(this).popAndPushNamed(routeName, arguments: arguments);

  /// Push a new route and remove all routes until a certain condition is met
  Future<T?> pushAndRemoveUntil(
          String routeName, bool Function(Route<dynamic>) predicate,
          {Object? arguments}) =>
      Navigator.of(this)
          .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);

  /// Pop the current route
  void pop() => Navigator.of(this).pop();

  /// Check if there is a route that can be popped
  bool canPop() => Navigator.of(this).canPop();
}
