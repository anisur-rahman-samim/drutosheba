class ReturnTripModel {
  ReturnTripModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<ReturnTrip> data;

  factory ReturnTripModel.fromJson(Map<String, dynamic> json){
    return ReturnTripModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<ReturnTrip>.from(json["data"]!.map((x) => ReturnTrip.fromJson(x))),
    );
  }

}

class ReturnTrip {
  ReturnTrip({
    required this.id,
    required this.pickupDivision,
    required this.dropoffDivision,
    required this.location,
    required this.destination,
    required this.amount,
    required this.timedate,
    required this.partnerId,
    required this.vehicleId,
    required this.biding,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.getvehicle,
    required this.getpartner,
    required this.bidDetails,
  });

  final int? id;
  final int? pickupDivision;
  final int? dropoffDivision;
  final String? location;
  final String? destination;
  final String? amount;
  final String? timedate;
  final int? partnerId;
  final int? vehicleId;
  final int? biding;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Getvehicle? getvehicle;
  final Getpartner? getpartner;
  final dynamic bidDetails;

  factory ReturnTrip.fromJson(Map<String, dynamic> json){
    return ReturnTrip(
      id: json["id"],
      pickupDivision: json["pickup_division"],
      dropoffDivision: json["dropoff_division"],
      location: json["location"],
      destination: json["destination"],
      amount: json["amount"],
      timedate: json["timedate"],
      partnerId: json["partner_id"],
      vehicleId: json["vehicle_id"],
      biding: json["biding"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      getvehicle: json["getvehicle"] == null ? null : Getvehicle.fromJson(json["getvehicle"]),
      getpartner: json["getpartner"] == null ? null : Getpartner.fromJson(json["getpartner"]),
      bidDetails: json["bid_details"],
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

class Getvehicle {
  Getvehicle({
    required this.id,
    required this.vehicleCategory,
    required this.name,
    required this.nameBn,
    required this.slug,
    required this.capacity,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? vehicleCategory;
  final String? name;
  final String? nameBn;
  final String? slug;
  final String? capacity;
  final String? image;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Getvehicle.fromJson(Map<String, dynamic> json){
    return Getvehicle(
      id: json["id"],
      vehicleCategory: json["vehicle_category"],
      name: json["name"],
      nameBn: json["name_bn"],
      slug: json["slug"],
      capacity: json["capacity"],
      image: json["image"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
