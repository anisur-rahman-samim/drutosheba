class LeaderboardModel {
  LeaderboardModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<Leader> data;

  factory LeaderboardModel.fromJson(Map<String, dynamic> json){
    return LeaderboardModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Leader>.from(json["data"]!.map((x) => Leader.fromJson(x))),
    );
  }

}

class Leader {
  Leader({
    required this.totalSum,
    required this.partnerId,
    required this.getpartner,
  });

  final String? totalSum;
  final int? partnerId;
  final Getpartner? getpartner;

  factory Leader.fromJson(Map<String, dynamic> json){
    return Leader(
      totalSum: json["totalSum"],
      partnerId: json["partner_id"],
      getpartner: json["getpartner"] == null ? null : Getpartner.fromJson(json["getpartner"]),
    );
  }

}

class Getpartner {
  Getpartner({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.docType,
    required this.docNumber,
    required this.docFront,
    required this.docBack,
    required this.division,
    required this.address,
    required this.gender,
    required this.referCode,
    required this.myreferKey,
    required this.verify,
    required this.forgotCode,
    required this.credit,
    required this.debit,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? image;
  final String? docType;
  final String? docNumber;
  final String? docFront;
  final String? docBack;
  final dynamic division;
  final String? address;
  final String? gender;
  final dynamic referCode;
  final String? myreferKey;
  final String? verify;
  final String? forgotCode;
  final int? credit;
  final int? debit;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Getpartner.fromJson(Map<String, dynamic> json){
    return Getpartner(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      image: json["image"],
      docType: json["doc_type"],
      docNumber: json["doc_number"],
      docFront: json["doc_front"],
      docBack: json["doc_back"],
      division: json["division"],
      address: json["address"],
      gender: json["gender"],
      referCode: json["refer_code"],
      myreferKey: json["myrefer_key"],
      verify: json["verify"],
      forgotCode: json["forgot_code"],
      credit: json["credit"],
      debit: json["debit"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
