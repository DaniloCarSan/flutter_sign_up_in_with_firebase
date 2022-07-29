import 'package:validators/validators.dart';

class Validators {
  static String? textRequired(String? string,
      {String isRequired = "Campo Obrigatório !"}) {
    if (string == null) return isRequired;

    if (string.isEmpty) return isRequired;

    return null;
  }

  static String? validateEmail(
    String? email, {
    dynamic? isRequired = "Campo obrigatório",
    dynamic? isInvalid = 'Email inválido',
    dynamic isValid,
  }) {
    if (email == null) return isRequired;

    if (email.isEmpty) return isRequired;

    if (!isEmail(email)) return isInvalid;

    return isValid;
  }

  static String? validatePassword(
    String? password, {
    dynamic? isRequired = "Campo obrigatório",
    dynamic? isInvalid = 'Senha inválida',
    dynamic isValid,
  }) {
    if (password == null) return isRequired;

    if (password.isEmpty) return isRequired;

    if(isInvalid != null)
    {
      if (!RegExp(r'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[*.!@$%^&(){[}[:;<>,.?/~_+-=|\\]).{6,16}')
        .hasMatch(password))
      {
        return isInvalid;
      }
    }

    if (isValid != null) {
      return isValid;
    }

    return null;
  }
}
