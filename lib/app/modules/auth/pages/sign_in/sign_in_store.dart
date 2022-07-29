import 'package:mobx/mobx.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
 
  @observable
  bool isFormValidated = false;

  void setIsFormValidated(bool value) {
    isFormValidated = value;
  }

  Future<void> signIn(String email, String password) async {

  }

}
