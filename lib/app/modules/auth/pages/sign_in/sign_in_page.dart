import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sign_up_in_with_firebase/app/modules/auth/pages/forgot_password/forgot_password_page.dart';
import 'package:flutter_sign_up_in_with_firebase/app/modules/auth/pages/sign_in/sign_in_store.dart';
import 'package:flutter_sign_up_in_with_firebase/app/modules/auth/pages/sign_up/sign_up_page.dart';
import 'package:flutter_sign_up_in_with_firebase/app/modules/auth/widgets/auth_page_tampate_widget/auth_page_tampate_widget.dart';
import 'package:flutter_sign_up_in_with_firebase/app/widgets/logo_widget/logo_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../utils/validators.dart';
import '../../../../widgets/input_showdow_widget/input_showdow_widget.dart';
import '../../../../widgets/version_info_widget_widget/version_info_widget_widget.dart';
import '../../auth_module.dart';
import '../../widgets/card_auth_template_widget/card_auth_template_widget.dart';

final bindSignInStore = Bind.lazySingleton((i) => SignInStore());

final routeSignInPage =
    ChildRoute(SignInPage.pageName, child: (_, args) => const SignInPage());

class SignInPage extends StatefulWidget {
  static String pageName = '/sign_in';

  static String route = "${AuthModule.route}$pageName";

  const SignInPage({Key? key}) : super(key: key);

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final SignInStore _store = Modular.get();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _tecEmail = TextEditingController();
  final TextEditingController _tecPasssord = TextEditingController();

  bool obscureText = true;

  void switchObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void goToForgotPasswordPage() {
    Modular.to.pushNamed(ForgotPasswordPage.route);
  }

  void goToSignInPage() {
    Modular.to.pushNamed(SignUpPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageTemplateWidget(
      child: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        children: [
          const LogoWidget(
            padding: 80,
          ),
          CardAuthTemplateWidget(
            title: 'Sign in',
            child: Form(
              key: _formKey,
              onChanged: () => _store.setIsFormValidated(
                _formKey.currentState!.validate(),
              ),
              child: Column(
                children: [
                  buildInputTextEmail(),
                  const SizedBox(
                    height: 15,
                  ),
                  buildTextInputPassword(),
                  const SizedBox(
                    height: 15,
                  ),
                  buildElevatedButtonLogin(context),
                  const SizedBox(
                    height: 15,
                  ),
                  buildGoToPageSigUp(),
                  buildGotoPageForgotPassword(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const VersionInfoWidgetWidget()
        ],
      ),
    );
  }

  Widget buildInputTextEmail() {
    return InputShadow(
      child: TextFormField(
        controller: _tecEmail,
        validator: Validators.validateEmail,
        inputFormatters: [FilteringTextInputFormatter.deny(" ")],
        decoration: const InputDecoration(
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
      child: TextFormField(
        controller: _tecPasssord,
        validator: Validators.validatePassword,
        inputFormatters: [
          FilteringTextInputFormatter.deny(" "),
        ],
        obscureText: obscureText,
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            FontAwesomeIcons.lock,
          ),
          suffixIcon: GestureDetector(
            dragStartBehavior: DragStartBehavior.down,
            child: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onTap: () => switchObscureText(),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Enter a password',
        ),
      ),
    );
  }

  Widget buildElevatedButtonLogin(BuildContext context) {
    return Observer(
      builder: (context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(57),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 15),
        ),
        onPressed: _store.isFormValidated ? () => signIn(context) : null,
      ),
    );
  }

  Widget buildGoToPageSigUp() {
    return Center(
      child: TextButton(
        onPressed: goToSignInPage,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Don´t have an account ? ',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal)),
            Text('Sign Up',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget buildGotoPageForgotPassword() {
    return Center(
      child: TextButton(
        child: const Text('Forgot password !',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ForgotPasswordPage())),
      ),
    );
  }

  signIn(BuildContext context) async {

    var response = await _store.signIn(
      _tecEmail.text,
      _tecPasssord.text,
    );

  }
}
