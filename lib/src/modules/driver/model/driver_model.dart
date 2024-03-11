class DriversModel {
  DriversModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<Datum> data;

  factory DriversModel.fromJson(Map<String, dynamic> json){
    return DriversModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.partnerId,
    required this.name,
    required this.phone,
    required this.contactNo,
    required this.email,
    required this.gender,
    required this.address,
    required this.drivingNo,
    required this.drivingImage,
    required this.nidFront,
    required this.nidBack,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? partnerId;
  final String? name;
  final String? phone;
  final String? contactNo;
  final String? email;
  final String? gender;
  final String? address;
  final String? drivingNo;
  final String? drivingImage;
  final String? nidFront;
  final String? nidBack;
  final String? image;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      partnerId: json["partner_id"],
      name: json["name"],
      phone: json["phone"],
      contactNo: json["contact_no"],
      email: json["email"],
      gender: json["gender"],
      address: json["address"],
      drivingNo: json["driving_no"],
      drivingImage: json["driving_image"],
      nidFront: json["nid_front"],
      nidBack: json["nid_back"],
      image: json["image"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
