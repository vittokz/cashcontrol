import 'package:cashcontrol/src/pages/dashboard.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> rutasGenerales() {
  return {
    '/': (context) => DashboardPage(),
  };
}
