import 'package:financetrack/features/transaction/repository/trans_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transControllerProvider = Provider((ref) {
  final transRepository = ref.watch(transRepositoryProvider);
  return TransController(transRepository: transRepository, ref: ref);
});

class TransController {
  final TransRepository transRepository;
  final Ref ref;

  TransController({required this.transRepository, required this.ref});

  Future saveTransaction({
    required BuildContext context,
    required String status,
    required double amount,
    required String category,
    String? note,
    required DateTime date,
    required Widget destination,
  }) async {
    
    return transRepository.saveTransaction(
      context: context,
      ref: ref,
      status: status,
      amount: amount,
      note: note,
      category: category,
      date: date,
      destination: destination,
    );
  }
}
