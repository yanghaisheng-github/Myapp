import 'package:flutter/material.dart';
import '../ui/login_screen.dart';
import '../ui/dashboard_screen.dart';
import '../ui/hometabs_screen.dart';

//定义命名路由
final routes = {
  '/': (context, {argumtents}) => LoginScreen(),
  '/auth': (context, {argumtents}) => LoginScreen(),
  '/hometabs' : (context, {argumtents}) => HomeTabs(),
  '/dashboard': (context, {argumtents}) => DashboardScreen(),
};

var onGenerateRoute = (RouteSettings settings) {
  // settings.name是传入的命名路由名称，如上面的/homepage
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
