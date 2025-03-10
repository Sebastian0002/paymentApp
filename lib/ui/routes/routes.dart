import 'package:flutter/material.dart';
import 'package:payment_app/ui/pages/pages.dart';

class Routes {

  static String initialRoutes = HomePage.route;

  static final Map<String,WidgetBuilder> routes = {
    HomePage.route : (_) => const HomePage(),
    CartPage.route : (_) => const CartPage(),
  };

}