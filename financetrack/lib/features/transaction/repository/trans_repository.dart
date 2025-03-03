// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financetrack/features/auth/controller/auth_controller.dart';
import 'package:financetrack/models/transaction_model.dart';
import 'package:financetrack/utils/show_snack_bar.dart';
import 'package:financetrack/utils/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final transRepositoryProvider = Provider(
  (ref) => TransRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class TransRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  TransRepository({required this.firestore, required this.auth});

  Future saveTransaction({
    required BuildContext context,
    required Ref ref,
    required String status,
    required double amount,
    required String category,
    required DateTime date,
    required Widget destination,
    String? note,
  }) async {
    try {
      showCircleLoader();
      Uuid uuid = Uuid();
      String id = uuid.v4().substring(0, 6);
      String creator = await ref.read(authControllerProvider).getUserName();

      var user = TransModel(
        id: id,
        amount: amount,
        status: status,
        category: category,
        createdBy: creator,
        date: date,
        note: note,
      );

      await firestore.collection('transactions').doc(id).set(user.toMap());
      showSnackBar(
        context: context,
        status: Status.success,
        message: 'Transaction added successfully!',
      );
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
}
