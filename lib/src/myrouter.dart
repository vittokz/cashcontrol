import 'package:cashcontrol/src/pages/history_page.dart';
import 'package:cashcontrol/src/pages/home_page.dart';
import 'package:flutter/material.dart' show WidgetBuilder;

class MyRouter {
  static final Map<String, WidgetBuilder> _routes = {
    '/': (_) => HomePage(),
    'history': (_) => HistoryPage()
  };
  static Map<String, WidgetBuilder> get routes => _routes;
}