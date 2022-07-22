import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/auth_module.dart';
import 'modules/auth/pages/splash/splash_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    bindSplashStore
  ];

  @override
  final List<ModularRoute> routes = [
    routeSplashPage,
    moduleRouteAuthModule
  ];

}