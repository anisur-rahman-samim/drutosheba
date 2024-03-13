class CreditModel {
  CreditModel({
     this.status,
     this.data,
  });

  final String? status;
  final Data? data;

  factory CreditModel.fromJson(Map<String, dynamic> json){
    return CreditModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.lifetimeDebitCredit,
    required this.currentBalance,
    required this.currentBonus,
    required this.currentCredit,
  });

  final LifetimeDebitCredit? lifetimeDebitCredit;
  final int? currentBalance;
  final int? currentBonus;
  final int? currentCredit;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      lifetimeDebitCredit: json["lifetimeDebitCredit"] == null ? null : LifetimeDebitCredit.fromJson(json["lifetimeDebitCredit"]),
      currentBalance: json["currentBalance"],
      currentBonus: json["currentBonus"],
      currentCredit: json["currentCredit"],
    );
  }

}

class LifetimeDebitCredit {
  LifetimeDebitCredit({
    required this.credit,
    required this.debit,
  });

  final int? credit;
  final int? debit;

  factory LifetimeDebitCredit.fromJson(Map<String, dynamic> json){
    return LifetimeDebitCredit(
      credit: json["credit"],
      debit: json["debit"],
    );
  }

}
