import 'package:flutter_modular/flutter_modular.dart';

import 'pages/forgot_password/forgot_password_page.dart';
import 'pages/sign_in/sign_in_page.dart';
import 'pages/sign_up/sign_up_page.dart';

final moduleRouteAuthModule = ModuleRoute(AuthModule.route, module: AuthModule());

class AuthModule extends Module {
  static String route = '/auth';

  @override
  final List<Bind> binds = [
    bindSignInStore,
    bindSignUpStore,
    bindForgotPasswordStore,
  ];

  @override
  final List<ModularRoute> routes = [
    routeSignInPage,
    routeSignUpPage,
    routeForgotPasswordPage,
  ];
}
