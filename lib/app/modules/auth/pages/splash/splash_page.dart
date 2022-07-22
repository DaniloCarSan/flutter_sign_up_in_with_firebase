import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sign_up_in_with_firebase/app/modules/auth/pages/sign_in/sign_in_page.dart';
import 'package:flutter_sign_up_in_with_firebase/app/modules/auth/widgets/auth_page_tampate_widget/auth_page_tampate_widget.dart';

import './splash_store.dart';

final bindSplashStore = Bind.lazySingleton((i) => SplashStore());

final routeSplashPage = ChildRoute(Modular.initialRoute, child: (_, args) => const SplashPage());

class SplashPage extends StatefulWidget {
  static String pageName = Modular.initialRoute;

  static String route = pageName;

  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Modular.to.pushNamed(SignInPage.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageTemplateWidget(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            FlutterLogo(
              key: Key('FlutterLogo'),
              size: 300,
              style: FlutterLogoStyle.horizontal,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
