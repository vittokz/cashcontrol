import 'package:cashcontrol/src/pages/home_page.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> rutasGenerales() {
  return {
    '/': (context) => HomePage(),
  };
}
