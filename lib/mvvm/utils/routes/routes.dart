import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management/mvvm/utils/routes/routes_name.dart';
import 'package:state_management/mvvm/view/home_screen.dart';

import '../../view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argume = settings.arguments;
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreenMVVM());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreenMVVM());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route define"),
            ),
          );
        });
    }
  }
}
