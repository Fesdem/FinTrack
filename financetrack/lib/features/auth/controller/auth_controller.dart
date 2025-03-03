import 'package:financetrack/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

class AuthController {
  final AuthRepository authRepository;
  final Ref ref;

  AuthController({required this.authRepository, required this.ref});

  Future createAccountWithEmail({
    required BuildContext context,
    required String email,
    required String password,
    required Widget destination,
  }) async {
    authRepository.createAccountWithEmail(
      context: context,
      email: email,
      password: password,
      destination: destination,
    );
  }

  Future logInWithEmail({
    required BuildContext context,
    required String email,
    required String password,
    required Widget destination,
  }) async {
    authRepository.logInWithEmail(
      context: context,
      email: email,
      password: password,
      destination: destination,
    );
  }

  Future saveUserDataToFirebase({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String userName,
    required Widget destination,
  }) async {
    authRepository.saveUserDataToFirebase(
      context: context,
      firName: firstName,
      lasName: lastName,
      userName: userName,
      destination: destination,
    );
  }

  Future<String> getUserName() {
    return authRepository.getUserName();
  }

  Future<String> getFirstName() {
    return authRepository.getFirstName();
  }

  Future<String> getLastName() {
    return authRepository.getLastName();
  }

  Future logOut(BuildContext context) async {
    return authRepository.logOut(context);
  }
}
