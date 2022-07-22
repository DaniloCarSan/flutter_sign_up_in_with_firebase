import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sign_up_in_with_firebase/app/modules/auth/pages/sign_up/sign_up_store.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../widgets/input_showdow_widget/input_showdow_widget.dart';
import '../../../../widgets/logo_widget/logo_widget.dart';
import '../../../../widgets/version_info_widget_widget/version_info_widget_widget.dart';
import '../../auth_module.dart';
import '../../widgets/auth_page_tampate_widget/auth_page_tampate_widget.dart';
import '../../widgets/card_auth_template_widget/card_auth_template_widget.dart';
import '../sign_in/sign_in_page.dart';

final bindSignUpStore = Bind.lazySingleton((i) => SignUpStore());

final routeSignUpPage =
    ChildRoute(SignUpPage.pageName, child: (_, args) => const SignUpPage());

class SignUpPage extends StatefulWidget {
  static String pageName = '/sign_up';

  static String route = "${AuthModule.route}$pageName";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  void goBackSignInPage() {
    Modular.to.pushNamed(SignInPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageTemplateWidget(
      child: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        children: [
          const LogoWidget(),
          CardAuthTemplateWidget(
            title: 'Sign Up',
            child: Column(
              children: [
                buildInputTextFullName(),
                const SizedBox(
                  height: 15,
                ),
                buildInputTextEmail(),
                const SizedBox(
                  height: 15,
                ),
                buildTextInputPassword(),
                const SizedBox(
                  height: 15,
                ),
                buildTextInputConfirmPassword(),
                const SizedBox(
                  height: 15,
                ),
                buildElevatedButtonSignIp(),
                const SizedBox(
                  height: 15,
                ),
                buildGoBackLoginPage(),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const VersionInfoWidgetWidget(),
        ],
      ),
    );
  }

  Widget buildInputTextFullName() {
    return InputShadow(
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            FontAwesomeIcons.userLarge,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Enter your fullname',
        ),
      ),
    );
  }

  Widget buildInputTextEmail() {
    return InputShadow(
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            FontAwesomeIcons.solidEnvelope,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Enter a email',
        ),
      ),
    );
  }

  Widget buildTextInputPassword() {
    return InputShadow(
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            FontAwesomeIcons.lock,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Enter a password',
        ),
      ),
    );
  }

  Widget buildTextInputConfirmPassword() {
    return InputShadow(
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            FontAwesomeIcons.lock,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Confirm password',
        ),
      ),
    );
  }

  Widget buildElevatedButtonSignIp() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(57),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Register',
        style: TextStyle(fontSize: 15),
      ),
      onPressed: () {},
    );
  }

  Widget buildGoBackLoginPage() {
    return Center(
      child: TextButton(
        onPressed: goBackSignInPage,
        child: const Text(
          'Go back',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
