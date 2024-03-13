class OffersModel {
  OffersModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<Datum> data;

  factory OffersModel.fromJson(Map<String, dynamic> json){
    return OffersModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.vehicleId,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updateAt,
    required this.startedAt,
    required this.expiredAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final int? vehicleId;
  final String? image;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updateAt;
  final String? startedAt;
  final String? expiredAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      vehicleId: json["vehicle_id"],
      image: json["image"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updateAt: DateTime.tryParse(json["update_at"] ?? ""),
      startedAt: json["started_at"],
      expiredAt: json["expired_at"],
    );
  }

}
