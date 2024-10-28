import 'package:flutter/material.dart';
import 'package:payment_app/pages/pages.dart';

class Routes {

  static String initialRoutes = HomePage.route;

  static final Map<String,WidgetBuilder> routes = {
    HomePage.route : (context) => const HomePage()
  };

}