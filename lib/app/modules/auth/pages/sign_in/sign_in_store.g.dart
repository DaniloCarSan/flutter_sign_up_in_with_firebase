// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on _SignInStoreBase, Store {
  late final _$isFormValidatedAtom =
      Atom(name: '_SignInStoreBase.isFormValidated', context: context);

  @override
  bool get isFormValidated {
    _$isFormValidatedAtom.reportRead();
    return super.isFormValidated;
  }

  @override
  set isFormValidated(bool value) {
    _$isFormValidatedAtom.reportWrite(value, super.isFormValidated, () {
      super.isFormValidated = value;
    });
  }

  @override
  String toString() {
    return '''
isFormValidated: ${isFormValidated}
    ''';
  }
}
