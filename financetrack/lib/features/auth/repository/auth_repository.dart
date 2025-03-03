// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financetrack/features/auth/repository/user_repository.dart';
import 'package:financetrack/features/auth/views/login_screen.dart';
import 'package:financetrack/models/user_model.dart';
import 'package:financetrack/utils/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.firestore, required this.auth});

  void createAccountWithEmail({
    required BuildContext context,
    required String email,
    required String password,
    required Widget destination,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await UserRepository.saveUserStateToSharedPref(true, 'isLoggedIn');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => destination),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String firMessage = 'The email already exists!';
      String secMessage = 'This operation is not allowed!';
      String thirMessage = 'Check your internet connection and try again!';
      String fouMessage = 'The password used is weak!';
      String fifMessage = 'An error ocurred. Please try again later!';
      showSnackBar(
        context: context,
        status: Status.error,
        message:
            e.code.contains('email-already-in-use')
                ? firMessage
                : e.code.contains('operation-not-allowed')
                ? secMessage
                : e.code.contains('network-request-failed')
                ? thirMessage
                : e.code.contains('weak-password')
                ? fouMessage
                : fifMessage,
      );
      Navigator.of(context).pop();
    }
  }

  Future saveUserDataToFirebase({
    required BuildContext context,
    required String firName,
    required String lasName,
    required String userName,
    required Widget destination,
  }) async {
    try {
      String id = auth.currentUser!.uid;
      String email = auth.currentUser!.email!;
      String? token = await FirebaseMessaging.instance.getToken();

      var user = UserModel(
        id: id,
        email: email,
        firName: firName,
        lasName: lasName,
        userName: userName,
        deviceToken: token ?? '',
      );

      await firestore.collection('users').doc(id).set(user.toMap());
      await UserRepository.saveUserStateToSharedPref(true, 'IsAuthorized');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => destination),
        (route) => false,
      );
    } catch (e) {
      showSnackBar(
        context: context,
        status: Status.error,
        message: 'An internal error ocurred. Try again later!',
      );
    }
  }

  void logInWithEmail({
    required BuildContext context,
    required String email,
    required String password,
    required Widget destination,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      await UserRepository.saveUserStateToSharedPref(true, 'isLoggedIn');
      await UserRepository.saveUserStateToSharedPref(true, 'IsAuthorized');

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => destination),
        (route) => false,
      );
      debugPrint('User logged in successfully!');
    } on FirebaseAuthException catch (e) {
      String firMessage = 'The email does not exist!';
      String secMessage = 'The credentials provided is incorrect.';
      String thirMessage = 'Check your internet connection and try again!';
      String fouMessage = 'Invalid Login credentials.';
      String fifMessage = 'An error ocurred. Please try again later!';
      showSnackBar(
        context: context,
        status: Status.error,
        message:
            e.code.contains('user-not-found')
                ? firMessage
                : e.code.contains('wrong-password')
                ? secMessage
                : e.code.contains('network-request-failed')
                ? thirMessage
                : (e.code.contains('INVALID_LOGIN_CREDENTIALS') ||
                    e.code.contains('invalid-credential'))
                ? fouMessage
                : fifMessage,
      );
      Navigator.of(context).pop();
    }
  }

  Future logOut(BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await auth.signOut();
      await prefs.clear();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    } catch (e) {
      String message = 'An error occured. Try again later!';
      showSnackBar(context: context, status: Status.error, message: message);
    }
  }

  Future<String> getFirstName() async {
    String uid = auth.currentUser!.uid;
    var info =
        await firestore
            .collection('pauprix')
            .doc('information')
            .collection('staff')
            .doc(uid)
            .get();

    if (info.exists) {
      UserModel currentInfo = UserModel.fromMap(info.data()!);
      String returnedInfo = currentInfo.firName;
      return returnedInfo;
    } else {
      return '';
    }
  }

  Future<String> getLastName() async {
    String uid = auth.currentUser!.uid;
    var info = await firestore.collection('users').doc(uid).get();

    if (info.exists) {
      UserModel currentInfo = UserModel.fromMap(info.data()!);
      String returnedInfo = currentInfo.lasName;
      return returnedInfo;
    } else {
      return '';
    }
  }

  Future<String> getUserName() async {
    String uid = auth.currentUser!.uid;
    var info = await firestore.collection('users').doc(uid).get();

    if (info.exists) {
      UserModel currentInfo = UserModel.fromMap(info.data()!);
      String returnedInfo = currentInfo.userName;
      return returnedInfo;
    } else {
      return '';
    }
  }
}
