// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransModel {
  String id;
  double amount;
  String status;
  String category;
  String createdBy;
  String? editedBy;
  DateTime date;
  String? note;
  TransModel({
    required this.id,
    required this.amount,
    required this.status,
    required this.category,
    required this.createdBy,
    this.editedBy,
    required this.date,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'status': status,
      'category': category,
      'createdBy': createdBy,
      'editedBy': editedBy,
      'date': date.toIso8601String(),
      'note': note,
    };
  }

  factory TransModel.fromMap(Map<String, dynamic> map) {
    return TransModel(
      id: map['id'],
      amount: map['amount'],
      status: map['status'],
      category: map['category'],
      createdBy: map['createdBy'],
      editedBy: map['editedBy'],
      date: DateTime.parse(map['date']),
      note: map['note'],
    );
  }
}
