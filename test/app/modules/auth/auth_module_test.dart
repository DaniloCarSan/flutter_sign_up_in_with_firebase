import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sign_up_in_with_firebase/app/./modules/auth/auth_module.dart';
 
void main() {

  setUpAll(() {
    initModule(AuthModule());
  });
}