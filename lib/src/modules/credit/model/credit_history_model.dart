class CreditHistoryModel {
  CreditHistoryModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<CreditHistory> data;

  factory CreditHistoryModel.fromJson(Map<String, dynamic> json){
    return CreditHistoryModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<CreditHistory>.from(json["data"]!.map((x) => CreditHistory.fromJson(x))),
    );
  }

}

class CreditHistory {
  CreditHistory({
    required this.id,
    required this.name,
    required this.partnerId,
    required this.amount,
    required this.type,
    required this.debitType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final int? partnerId;
  final int? amount;
  final String? type;
  final String? debitType;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CreditHistory.fromJson(Map<String, dynamic> json){
    return CreditHistory(
      id: json["id"],
      name: json["name"],
      partnerId: json["partner_id"],
      amount: json["amount"],
      type: json["type"],
      debitType: json["debit_type"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
