class TripBidShowModel {
  TripBidShowModel({
     this.status,
     this.message,
    required this.data,
  });

  final String? status;
  final String? message;
  final List<TripBidShow> data;

  factory TripBidShowModel.fromJson(Map<String, dynamic> json){
    return TripBidShowModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? [] : List<TripBidShow>.from(json["data"]!.map((x) => TripBidShow.fromJson(x))),
    );
  }

}

class TripBidShow {
  TripBidShow({
    required this.id,
    required this.tripId,
    required this.customerId,
    required this.partnerId,
    required this.vehicleId,
    required this.carId,
    required this.amount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.getpartner,
  });

  final int? id;
  final int? tripId;
  final int? customerId;
  final int? partnerId;
  final int? vehicleId;
  final int? carId;
  final String? amount;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Getpartner? getpartner;

  factory TripBidShow.fromJson(Map<String, dynamic> json){
    return TripBidShow(
      id: json["id"],
      tripId: json["trip_id"],
      customerId: json["customer_id"],
      partnerId: json["partner_id"],
      vehicleId: json["vehicle_id"],
      carId: json["car_id"],
      amount: json["amount"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
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
  final String? division;
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
