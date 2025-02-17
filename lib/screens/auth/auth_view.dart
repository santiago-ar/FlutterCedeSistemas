library app.auth;

import 'package:flutter/material.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';

import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/widgets/button.dart';
import 'package:fluttergram/widgets/input.dart';
import 'package:fluttergram/widgets/social_button.dart';

part 'login_view.dart';
part 'sign_up_view.dart';

class AuthView extends StatelessWidget {
  static String route = '/auth';
  final NavigatorService navigator = locator<NavigatorService>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: LoginView.route,
      key: navigator.authNavigatorKey,
      onGenerateRoute: autheticationRouteStack,
    );
  }
}

Route<dynamic> autheticationRouteStack(RouteSettings settings) {
  Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
    SignUpView.route: MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: settings.name),
      builder: (_) => SignUpView(),
    ),
    LoginView.route: MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: settings.name),
      builder: (_) => LoginView(),
    ),
  };

  return appRouting[settings.name]!;
}
