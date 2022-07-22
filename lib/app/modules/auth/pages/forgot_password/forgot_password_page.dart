import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../widgets/input_showdow_widget/input_showdow_widget.dart';
import '../../../../widgets/logo_widget/logo_widget.dart';
import '../../../../widgets/version_info_widget_widget/version_info_widget_widget.dart';
import '../../auth_module.dart';
import '../../widgets/auth_page_tampate_widget/auth_page_tampate_widget.dart';
import '../../widgets/card_auth_template_widget/card_auth_template_widget.dart';
import '../sign_up/sign_up_page.dart';
import 'forgot_password_store.dart';

final bindForgotPasswordStore =
    Bind.lazySingleton((i) => ForgotPasswordStore());

final routeForgotPasswordPage = ChildRoute(ForgotPasswordPage.pageName,
    child: (_, args) => const ForgotPasswordPage());

class ForgotPasswordPage extends StatefulWidget {
  static String pageName = '/forgot_password';

  static String route = "${AuthModule.route}$pageName";

  const ForgotPasswordPage({Key? key}) : super(key: key);
  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  void goToSignInPage() {
    Modular.to.pushNamed(SignUpPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageTemplateWidget(
      child: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        children: [
          const LogoWidget(),
          CardAuthTemplateWidget(
            title: 'Forgot Passsword',
            child: Column(
              children: [
                buildInputTextEmail(),
                const SizedBox(
                  height: 20,
                ),
                buildElevatedButtonReset(),
                buildGoBackLoginPage(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const VersionInfoWidgetWidget()
        ],
      ),
    );
  }

  Widget buildInputTextEmail() {
    return InputShadow(
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(FontAwesomeIcons.solidEnvelope),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Enter a email',
        ),
      ),
    );
  }

  Widget buildElevatedButtonReset() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(57),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Reset',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {},
    );
  }

  Widget buildGoBackLoginPage() {
    return Center(
      child: TextButton(
        onPressed: goToSignInPage,
        child: const Text('Go back',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
